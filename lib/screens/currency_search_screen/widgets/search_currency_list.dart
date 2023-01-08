import 'package:ednipro_test_app/blocs/search_bloc/search_bloc_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_events.dart';
import '../../../blocs/search_bloc/search_bloc.dart';
import '../../../blocs/search_bloc/search_bloc_states.dart';

class SearchCurrencyList extends StatelessWidget {
  const SearchCurrencyList({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyDataBloc = BlocProvider.of<CurrencyDataBloc>(context);
    return BlocBuilder<SearchBloc, SearchBlocState>(
      builder: (context, state) {
        if (state is SearchBlocDataState) {
          final searchBloc = BlocProvider.of<SearchBloc>(context);
          return ListView.separated(
            itemCount: state.data.length,
            addAutomaticKeepAlives: false,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    state.data[index].data.isFavotire
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: state.data[index].data.isFavotire
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () {
                    currencyDataBloc.add(CurrencyDataBlocFavoriteEvent(
                        index: state.data[index].index));
                    searchBloc.add(SearchBlocRefreshEvent());
                  },
                ),
                title: Text(state.data[index].data.currencyCountryName),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Buy: ${state.data[index].data.rateBuy}'),
                    Text('Sell: ${state.data[index].data.rateSell}'),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.black,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
