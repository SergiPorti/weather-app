part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  final bool isDarkMode;
  const ThemeState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class InitialThemeState extends ThemeState {
  const InitialThemeState() : super(isDarkMode: true);
}

class DarkModeState extends ThemeState {
  final bool value;
  const DarkModeState({required this.value}) : super(isDarkMode: value);
}
