import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_exchange_bloc_events.dart';
import 'currency_exchange_bloc_states.dart';

class CurrencyExchangeBloc
    extends Bloc<CurrencyExchangeBlocEvent, CurrencyExchangeBlocState> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  Map<String, double> data;
  String fromCurrencyName = 'USD';
  String toCurrencyName = 'USD';
  CurrencyExchangeBloc({required this.data})
      : super(CurrencyExchangeBlocInitState()) {
    on<CurrencyExchangeBlocChangeFromCurrencyNameEvent>(_changFromCurrencyName);
    on<CurrencyExchangeBlocChangeToCurrencyNameEvent>(_changToCurrencyName);
    on<CurrencyExchangeBlocExchangeEvent>(_exchange);
  }

  void _changFromCurrencyName(event, emit) {
    fromCurrencyName = event.value;
    if (fromController.value.text.isNotEmpty) {
      if (data[toCurrencyName]! != 0) {
        final fromValue = double.tryParse(fromController.value.text);
        if (fromValue != null) {
          final coefficient = data[fromCurrencyName]! / data[toCurrencyName]!;
          toController.value = TextEditingValue(
            text: (fromValue * coefficient).toString(),
          );
        } else {
          toController.value =
              const TextEditingValue(text: 'Enter the numeric value');
        }
      } else {
        toController.value = const TextEditingValue(text: '0');
      }
    }
  }

  void _changToCurrencyName(event, emit) {
    toCurrencyName = event.value;
    if (fromController.value.text.isNotEmpty) {
      if (data[toCurrencyName]! != 0) {
        final fromValue = double.tryParse(fromController.value.text);
        if (fromValue != null) {
          final coefficient = data[fromCurrencyName]! / data[toCurrencyName]!;
          toController.value = TextEditingValue(
            text: (fromValue * coefficient).toString(),
          );
        } else {
          toController.value =
              const TextEditingValue(text: 'Enter the numeric value');
        }
      } else {
        toController.value = const TextEditingValue(text: '0.0');
      }
    }
  }

  void _exchange(event, emit) {
    final fromValue = data[fromCurrencyName]!;
    final toValue = data[toCurrencyName]!;
    final userValue = double.tryParse(event.value);
    if (toValue != 0) {
      if (event.value.isEmpty) {
        toController.value = const TextEditingValue(text: '');
      } else {
        if (userValue != null) {
          toController.value = TextEditingValue(
            text: (userValue * (fromValue / toValue)).toString(),
          );
        } else {
          toController.value =
              const TextEditingValue(text: 'Enter the numeric value');
        }
      }
    } else {
      toController.value = const TextEditingValue(text: '0.0');
    }
    // double.tryParse(event.value as String) *
  }
}
