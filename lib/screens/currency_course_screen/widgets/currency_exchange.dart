import 'package:ednipro_test_app/entities/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_states.dart';
import '../../../blocs/currency_exchange_bloc/currency_exchange_bloc.dart';
import '../../../blocs/currency_exchange_bloc/currency_exchange_bloc_events.dart';
import '../../../blocs/currency_exchange_bloc/currency_exchange_bloc_states.dart';
import 'dropdown_currents.dart';

class CurrencyExchange extends StatelessWidget {
  const CurrencyExchange({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyDataBlocState =
        BlocProvider.of<CurrencyDataBloc>(context).state;
    if (currencyDataBlocState is CurrencyDataBlocLoadedState) {
      return BlocProvider<CurrencyExchangeBloc>(
        create: (BuildContext context) => CurrencyExchangeBloc(
            data: Converter.fromListCurrencyToMap(currencyDataBlocState.data)),
        child: BlocBuilder<CurrencyExchangeBloc, CurrencyExchangeBlocState>(
          builder: (BuildContext context, state) {
            final exchangeBloc = BlocProvider.of<CurrencyExchangeBloc>(context);
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: const InputDecoration(),
                        controller: exchangeBloc.fromController,
                        onChanged: (value) => exchangeBloc.add(
                          CurrencyExchangeBlocExchangeEvent(value: value),
                        ),
                      ),
                      DropdownCurrents(
                        labelText: 'From',
                        onChanged: (value) => exchangeBloc.add(
                          CurrencyExchangeBlocChangeFromCurrencyNameEvent(
                              value: value ?? 'USD'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_right,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        controller: exchangeBloc.toController,
                        decoration: const InputDecoration(),
                      ),
                      DropdownCurrents(
                        labelText: 'To',
                        onChanged: (value) => exchangeBloc.add(
                          CurrencyExchangeBlocChangeToCurrencyNameEvent(
                              value: value ?? 'USD'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
