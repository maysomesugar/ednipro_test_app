import '../../entities/currency_model.dart';

abstract class CurrencyDataBlocState {}

class CurrencyDataBlocInitState extends CurrencyDataBlocState {}

class CurrencyDataBlocLoadedState extends CurrencyDataBlocState {
  final List<Currency> data;

  CurrencyDataBlocLoadedState({required this.data});
}
