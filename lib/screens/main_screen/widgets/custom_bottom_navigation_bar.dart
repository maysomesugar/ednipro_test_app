import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/navigation_bloc/navigation_bloc.dart';
import '../../../blocs/navigation_bloc/navigation_bloc_events.dart';
import '../../../blocs/navigation_bloc/navigation_bloc_states.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationBlocState>(
        builder: (context, state) {
      final navigationBloc = BlocProvider.of<NavigationBloc>(context);
      return BottomNavigationBar(
        currentIndex: state.currentPage,
        onTap: (value) {
          navigationBloc.add(
            NavigationBlocChangePageEvent(newPage: value),
          );
        },
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'search',
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      );
    });
  }
}
