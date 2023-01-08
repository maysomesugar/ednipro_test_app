abstract class CurrencyExchangeBlocEvent {}

class CurrencyExchangeBlocChangeFromCurrencyNameEvent
    extends CurrencyExchangeBlocEvent {
  final String value;

  CurrencyExchangeBlocChangeFromCurrencyNameEvent({required this.value});
}

class CurrencyExchangeBlocChangeToCurrencyNameEvent
    extends CurrencyExchangeBlocEvent {
  final String value;

  CurrencyExchangeBlocChangeToCurrencyNameEvent({required this.value});
}

class CurrencyExchangeBlocExchangeEvent extends CurrencyExchangeBlocEvent {
  final String value;

  CurrencyExchangeBlocExchangeEvent({required this.value});
}
