import 'package:ednipro_test_app/blocs/currency_data_bloc/currency_data_bloc.dart';
import 'package:ednipro_test_app/blocs/currency_data_bloc/currency_data_bloc_states.dart';
import 'package:ednipro_test_app/entities/currency_model.dart';
import 'package:ednipro_test_app/screens/currency_course_screen/widgets/course_currency_list.dart';
import 'package:ednipro_test_app/screens/currency_course_screen/widgets/currency_exchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCourseScreen extends StatelessWidget {
  const CurrencyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDataBloc, CurrencyDataBlocState>(
      builder: (BuildContext context, state) {
        if (state is CurrencyDataBlocLoadedState) {
          final sortedData = List<Currency>.from(state.data);
          sortedData.sort((a, b) => (b.rateBuy - a.rateBuy).round());
          return Container(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: const [
                CurrencyExchange(),
                Expanded(
                  child: CurrencyList(),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.error,
              size: 100,
            ),
          );
        }
      },
    );
  }
}
