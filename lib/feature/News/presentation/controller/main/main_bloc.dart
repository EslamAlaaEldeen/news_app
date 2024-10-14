import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  static const String _themeKey = 'isDarkMode';

  MainBloc() : super(MainState(themeData: ThemeData.light())) {
    on<ChangeNavigationBarEvent>(_onTabChanged);
    on<ToggleThemeEvent>(_onThemeChange);
    on<LoadThemeEvent>(_onLoadTheme);
    add(const LoadThemeEvent());
  }

  FutureOr<void> _onTabChanged(
      ChangeNavigationBarEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> _onThemeChange(
      ToggleThemeEvent event, Emitter<MainState> emit) async {
    final isCurrentlyDark = state.themeData.brightness == Brightness.dark;

    final newTheme = isCurrentlyDark ? ThemeData.light() : ThemeData.dark();

    emit(state.copyWith(themeData: newTheme));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, !isCurrentlyDark);
  }

  Future<void> _onLoadTheme(
      LoadThemeEvent event, Emitter<MainState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;

    final newTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    emit(state.copyWith(themeData: newTheme));
  }
}
