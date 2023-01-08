import 'package:ednipro_test_app/entities/pair.dart';

import 'currency_model.dart';

class Converter {
  static List<Pair<int, Currency>> fromCurrencyListToListPair(
      List<Currency> data) {
    final List<Pair<int, Currency>> convertedData = [];
    for (int i = 0; i < data.length; i++) {
      convertedData.add(Pair(i, data[i]));
    }
    return convertedData;
  }

  static List<Pair<int, Currency>> fromCurrencyListToListPairWithFavorite(
      List<Currency> data) {
    final List<Pair<int, Currency>> convertedData = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i].isFavotire) {
        convertedData.add(Pair(i, data[i]));
      }
    }
    return convertedData;
  }

  static Map<String, double> fromListCurrencyToMap(List<Currency> data) {
    Map<String, double> convertedData = {};
    for (var element in data) {
      convertedData[element.currencyCountryName] = element.rateSell;
    }
    return convertedData;
  }
}
