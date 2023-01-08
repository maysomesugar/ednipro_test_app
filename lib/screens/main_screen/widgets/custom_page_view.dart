import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/navigation_bloc/navigation_bloc.dart';
import '../../../blocs/navigation_bloc/navigation_bloc_events.dart';
import '../../../blocs/navigation_bloc/navigation_bloc_states.dart';
import '../../currency_course_screen/currency_cource_screen.dart';
import '../../currency_search_screen/currency_search_screen.dart';
import '../../favorite_currency_screen/favorite_currency_screen.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationBlocState>(
        builder: (context, state) {
      final navigationBloc = BlocProvider.of<NavigationBloc>(context);
      return PageView(
        onPageChanged: (value) => navigationBloc.add(
          NavigationBlocChangePageEvent(newPage: value),
        ),
        controller: navigationBloc.controller,
        children: const [
          CurrencyCourseScreen(),
          CurrencySearchScreen(),
          FavoriteCurrencyScreen(),
        ],
      );
    });
  }
}
