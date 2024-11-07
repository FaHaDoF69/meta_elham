part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

class NavigationTabChanged extends NavigationState {
  final int selectedIndex;

  NavigationTabChanged(this.selectedIndex);
}
