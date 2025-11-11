part of 'bottom_navigation_cubit.dart';

@immutable
sealed class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {
  final int selectedIndex;

  BottomNavigationInitial({this.selectedIndex = 0});
}

class BottomNavigationChanged extends BottomNavigationState {
  final int selectedIndex;

  BottomNavigationChanged(this.selectedIndex);
}

