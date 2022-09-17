part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class GetThemeData extends ThemeEvent {}

class SaveThemeData extends ThemeEvent {
  final bool isDarkTheme;

  SaveThemeData({required this.isDarkTheme});
}
