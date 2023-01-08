abstract class NavigationBlocEvent {
  final int newPage;

  NavigationBlocEvent({required this.newPage});
}

class NavigationBlocChangePageEvent extends NavigationBlocEvent {
  NavigationBlocChangePageEvent({required super.newPage});
}
