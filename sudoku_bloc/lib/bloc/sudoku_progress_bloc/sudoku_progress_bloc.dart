import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'sudoku_progress_event.dart';
part 'sudoku_progress_state.dart';

class SudokuProgressBloc
    extends Bloc<SudokuProgressEvent, SudokuProgressState> {
  final SharedPreferenceRepository sharedPreferenceRepository;
  SudokuProgressBloc({required this.sharedPreferenceRepository})
      : super(SudokuProgressInitial()) {
    on<SaveProgress>(_onSaveProgressEvent);
    on<SaveDuration>(_onSaveDurationEvent);
  }

  FutureOr<void> _onSaveProgressEvent(
      SaveProgress event, Emitter<SudokuProgressState> emit) async {
    emit(SudokuProgressSaving());
    await sharedPreferenceRepository.setString(
        key: sudokuProgressKey, value: jsonEncode(event.sudokuNumbers));
    await sharedPreferenceRepository.setString(
        key: trackingNumbersKey,
        value:
            jsonEncode(event.trackingNumbers.map((e) => e.toJson()).toList()));

    emit(SudokuProgressSaved());
  }

  FutureOr<void> _onSaveDurationEvent(
      SaveDuration event, Emitter<SudokuProgressState> emit) async {
    emit(SudokuDurationSaving());
    await sharedPreferenceRepository.setString(
        key: trackingDurationKey,
        value: event.duration.toString().split('.')[0].padLeft(8, '0'));
    emit(SudokuDurationSaved());
  }
}
