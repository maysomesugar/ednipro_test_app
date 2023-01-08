import 'package:dio/dio.dart';

import '../../entities/currency_model.dart';

abstract class ApiClient {
  static String urlBody = 'https://api.monobank.ua';
  static String currencyPath = '/bank/currency';

  static Future<Response> get() async {
    var response = await Dio().get(urlBody + currencyPath);
    return response;
  }

  static Future<List<Currency>> getCurrenciesList() async {
    final response = (((await ApiClient.get()).data as List<dynamic>).map(
      (element) {
        final mapElement = Map<String, dynamic>.from(element);
        return Currency.fromJSON(mapElement);
      },
    )).where((element) => element.currencyCodeB == 980).toList();
    response.add(
      Currency(
        currencyCountryName: 'UAH',
        currencyCodeA: 980,
        currencyCodeB: 980,
        rateBuy: 1,
        rateSell: 1,
      ),
    );
    return response;
  }
}
