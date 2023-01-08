import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_bloc_events.dart';
import 'navigation_bloc_states.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  final controller = PageController();
  NavigationBloc() : super(NavigationBlocInitState()) {
    on<NavigationBlocChangePageEvent>(_changePage);
  }

  void _changePage(event, emit) {
    controller.animateToPage(
      event.newPage,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 250),
    );
    emit(NavigationBlocChangePageState(currentPage: event.newPage));
  }
}
