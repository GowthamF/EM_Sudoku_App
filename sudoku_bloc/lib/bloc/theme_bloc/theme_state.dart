part of 'theme_bloc.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDarkTheme;

  ThemeLoaded({required this.isDarkTheme});
}

class ThemeSaving extends ThemeState {}

class ThemeSaved extends ThemeState {}
