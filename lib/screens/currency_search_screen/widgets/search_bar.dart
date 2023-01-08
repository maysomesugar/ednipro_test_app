import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search_bloc/search_bloc.dart';
import '../../../blocs/search_bloc/search_bloc_events.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return TextField(
      controller: searchBloc.controller,
      decoration: const InputDecoration(
        hintText: 'Search a currents you want',
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      onChanged: (value) => searchBloc.add(SearchBlocSearchEvent(value: value)),
    );
  }
}
