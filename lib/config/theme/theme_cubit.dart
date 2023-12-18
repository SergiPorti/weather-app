import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const InitialThemeState());

  void updateTheme() => emit(DarkModeState(value: !state.isDarkMode));

  static ThemeData theme(bool isDarkMode) => ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 7, 19, 80)),
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light);
}
