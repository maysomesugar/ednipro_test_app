abstract class NavigationBlocState {
  final int currentPage;

  NavigationBlocState({required this.currentPage});
}

class NavigationBlocInitState extends NavigationBlocState {
  NavigationBlocInitState() : super(currentPage: 0);
}

class NavigationBlocChangePageState extends NavigationBlocState {
  NavigationBlocChangePageState({required super.currentPage});
}
