import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_events.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_states.dart';

class CurrencyList extends StatelessWidget {
  const CurrencyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDataBloc, CurrencyDataBlocState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CurrencyDataBloc>(context);
        if (state is CurrencyDataBlocLoadedState) {
          return ListView.separated(
            itemCount: state.data.length,
            addAutomaticKeepAlives: false,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    state.data[index].isFavotire
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: state.data[index].isFavotire
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () => bloc.add(
                    CurrencyDataBlocFavoriteEvent(index: index),
                  ),
                ),
                title: Text(state.data[index].currencyCountryName),
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
