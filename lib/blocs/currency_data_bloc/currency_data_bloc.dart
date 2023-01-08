import 'dart:async';

import 'package:ednipro_test_app/domain/api/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_data_bloc_events.dart';
import 'currency_data_bloc_states.dart';
import '../../entities/currency_model.dart';

class CurrencyDataBloc
    extends Bloc<CurrencyDataBlocEvent, CurrencyDataBlocState> {
  late final List<Currency> data;
  CurrencyDataBloc() : super(CurrencyDataBlocInitState()) {
    on<CurrencyDataBlocLoadingEvent>(_dataLoading);
    on<CurrencyDataBlocFavoriteEvent>(_favorite);
  }

  void _dataLoading(event, emit) async {
    try {
      data = await ApiClient.getCurrenciesList();
      emit(CurrencyDataBlocLoadedState(data: data));
    } catch (e) {
      Timer(
        const Duration(seconds: 5),
        () => super.add(
          CurrencyDataBlocLoadingEvent(),
        ),
      );
    }
  }

  void _favorite(event, emit) {
    data[event.index].isFavotire = !data[event.index].isFavotire;
    emit(CurrencyDataBlocLoadedState(data: data));
  }
}
