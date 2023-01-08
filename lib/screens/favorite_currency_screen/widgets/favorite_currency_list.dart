import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_events.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_states.dart';
import '../../../entities/converter.dart';
import '../../../entities/currency_model.dart';
import '../../../entities/pair.dart';

class FavotiteCurrencyList extends StatelessWidget {
  const FavotiteCurrencyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDataBloc, CurrencyDataBlocState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CurrencyDataBloc>(context);
        if (state is CurrencyDataBlocLoadedState) {
          final favoriteList =
              Converter.fromCurrencyListToListPairWithFavorite(state.data);
          if (favoriteList.isNotEmpty) {
            return ListView.separated(
              itemCount: favoriteList.length,
              addAutomaticKeepAlives: false,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      favoriteList[index].data.isFavotire
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: favoriteList[index].data.isFavotire
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () => bloc.add(
                      CurrencyDataBlocFavoriteEvent(
                          index: favoriteList[index].index),
                    ),
                  ),
                  title: Text(favoriteList[index].data.currencyCountryName),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Buy: ${state.data[index].rateBuy}'),
                      Text('Sell: ${state.data[index].rateSell}'),
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
              child: Text('You have no favorites'),
            );
          }
        } else if (state is CurrencyDataBlocInitState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.error,
            ),
          );
        }
      },
    );
  }
}
