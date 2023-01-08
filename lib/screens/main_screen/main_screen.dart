import 'package:ednipro_test_app/blocs/currency_data_bloc/currency_data_bloc.dart';
import 'package:ednipro_test_app/blocs/currency_data_bloc/currency_data_bloc_events.dart';
import 'package:ednipro_test_app/blocs/currency_data_bloc/currency_data_bloc_states.dart';
import 'package:ednipro_test_app/screens/main_screen/widgets/custom_bottom_navigation_bar.dart';
import 'package:ednipro_test_app/screens/main_screen/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/navigation_bloc/navigation_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<NavigationBloc>(
        create: (BuildContext context) => NavigationBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('eDnipro test app'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: BlocProvider<CurrencyDataBloc>(
              create: (BuildContext context) => CurrencyDataBloc(),
              child: BlocBuilder<CurrencyDataBloc, CurrencyDataBlocState>(
                builder: (BuildContext context, state) {
                  final bloc = BlocProvider.of<CurrencyDataBloc>(context);
                  if (state is CurrencyDataBlocInitState) {
                    bloc.add(CurrencyDataBlocLoadingEvent());
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CurrencyDataBlocLoadedState) {
                    return const CustomPageView();
                  } else {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        size: 100,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
