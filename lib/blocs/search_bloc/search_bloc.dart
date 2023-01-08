import 'dart:async';

import 'package:ednipro_test_app/entities/currency_model.dart';
import 'package:ednipro_test_app/blocs/search_bloc/search_bloc_events.dart';
import 'package:ednipro_test_app/blocs/search_bloc/search_bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/pair.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  Timer? searchDebounce;
  final controller = TextEditingController();
  final List<Pair<int, Currency>> data;
  SearchBloc({required this.data}) : super(SearchBlocDataState(data: data)) {
    on<SearchBlocSearchEvent>(_search);
    on<SearchBlocRefreshEvent>(_refresh);
  }

  void _search(event, emit) {
    final sortedData = data
        .where((element) => element.data.currencyCountryName
            .contains(event.value.toUpperCase()))
        .toList();
    emit(
      SearchBlocDataState(
        data: sortedData,
      ),
    );
  }

  void _refresh(event, emit) {
    final sortedData = data
        .where((element) => element.data.currencyCountryName
            .contains(controller.value.text.toUpperCase()))
        .toList();
    emit(
      SearchBlocDataState(
        data: sortedData,
      ),
    );
  }
}
