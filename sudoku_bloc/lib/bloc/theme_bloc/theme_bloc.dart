import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

const String themeKey = "ThemeKey";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferenceRepository sharedPreferenceRepository;

  ThemeBloc({required this.sharedPreferenceRepository})
      : super(ThemeInitial()) {
    on<GetThemeData>(_onGetThemeData);
    on<SaveThemeData>(_onSaveThemeData);
  }

  FutureOr<void> _onGetThemeData(
      GetThemeData event, Emitter<ThemeState> emit) async {
    emit(ThemeLoading());
    var isDarkTheme = await sharedPreferenceRepository.getBool(key: themeKey);

    emit(ThemeLoaded(isDarkTheme: isDarkTheme ?? false));
  }

  FutureOr<void> _onSaveThemeData(
      SaveThemeData event, Emitter<ThemeState> emit) async {
    await sharedPreferenceRepository.setBool(
        key: themeKey, value: event.isDarkTheme);
  }
}
