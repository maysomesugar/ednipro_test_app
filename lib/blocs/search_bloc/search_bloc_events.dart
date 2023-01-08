abstract class SearchBlocEvent {}

class SearchBlocSearchEvent extends SearchBlocEvent {
  final String value;

  SearchBlocSearchEvent({required this.value});
}

class SearchBlocRefreshEvent extends SearchBlocEvent {}
