import 'package:ednipro_test_app/screens/favorite_currency_screen/widgets/favorite_currency_list.dart';
import 'package:flutter/material.dart';

class FavoriteCurrencyScreen extends StatelessWidget {
  const FavoriteCurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const FavotiteCurrencyList(),
    );
  }
}
