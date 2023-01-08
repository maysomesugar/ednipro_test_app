import 'package:ednipro_test_app/entities/pair.dart';

import '../../entities/currency_model.dart';

abstract class SearchBlocState {}

class SearchBlocDataState extends SearchBlocState {
  final List<Pair<int, Currency>> data;

  SearchBlocDataState({required this.data});
}
