import 'package:ednipro_test_app/entities/currency_model.dart';
import 'package:ednipro_test_app/screens/currency_search_screen/widgets/search_currency_list.dart';
import 'package:ednipro_test_app/screens/currency_search_screen/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../blocs/search_bloc/search_bloc.dart';
import '../../entities/converter.dart';

class CurrencySearchScreen extends StatelessWidget {
  const CurrencySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyBlocData = BlocProvider.of<CurrencyDataBloc>(context).data;

    return BlocProvider<SearchBloc>(
      create: (BuildContext context) => SearchBloc(
          data: Converter.fromCurrencyListToListPair(currencyBlocData)),
      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: const [
            SearchBar(),
            Expanded(
              child: SearchCurrencyList(),
            ),
          ],
        ),
      ),
    );
  }
}
