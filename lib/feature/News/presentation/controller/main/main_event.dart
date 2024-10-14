part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ChangeNavigationBarEvent extends MainEvent {
  final int index;

  const ChangeNavigationBarEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ToggleThemeEvent extends MainEvent {
  const ToggleThemeEvent();
}

class LoadThemeEvent extends MainEvent {
  const LoadThemeEvent();
}
