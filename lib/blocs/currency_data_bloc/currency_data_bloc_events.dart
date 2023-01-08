abstract class CurrencyDataBlocEvent {}

class CurrencyDataBlocLoadingEvent extends CurrencyDataBlocEvent {}

class CurrencyDataBlocFavoriteEvent extends CurrencyDataBlocEvent {
  final int index;

  CurrencyDataBlocFavoriteEvent({required this.index});
}
