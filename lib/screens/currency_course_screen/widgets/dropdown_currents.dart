import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/currency_data_bloc/currency_data_bloc.dart';
import '../../../blocs/currency_data_bloc/currency_data_bloc_states.dart';

class DropdownCurrents extends StatelessWidget {
  final String labelText;
  final void Function(String?)? onChanged;
  const DropdownCurrents({
    super.key,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currencyDataBlocState =
        BlocProvider.of<CurrencyDataBloc>(context).state;
    if (currencyDataBlocState is CurrencyDataBlocLoadedState) {
      final items = currencyDataBlocState.data
          .map((element) => element.currencyCountryName)
          .toList();
      return DropdownSearch<String>(
        popupProps: const PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
        ),
        items: items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: labelText,
            hintText: "Currencies",
            border: InputBorder.none,
          ),
        ),
        dropdownButtonProps: const DropdownButtonProps(
          padding: EdgeInsets.all(0),
          splashRadius: 15,
        ),
        onChanged: onChanged,
        selectedItem: items.first,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
