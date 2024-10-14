part of 'main_bloc.dart';

class MainState extends Equatable {
  final int index;
  final ThemeData themeData;

  const MainState({required this.themeData, this.index = 0});

  MainState copyWith({
    int? index,
    ThemeData? themeData,
  }) {
    return MainState(
      index: index ?? this.index,
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [index, themeData];
}
