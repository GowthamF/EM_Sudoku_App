import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

part 'sudoku_event.dart';
part 'sudoku_state.dart';

class SudokuBloc extends Bloc<SudokuEvent, SudokuState> {
  SudokuBloc() : super(SudokuInitial()) {
    on<GenerateNumbers>(_onGenerateNumbersEvent);
    on<ResetNumbers>(_onResetNumbersEvent);
  }

  FutureOr<void> _onGenerateNumbersEvent(
      GenerateNumbers event, Emitter<SudokuState> emit) async {
    if (event.selectedLevel == Levels.hard) {
      await Future(() {
        var sudokuGenerator = SudokuGenerator(emptySquares: 54);

        emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
      });
    } else if (event.selectedLevel == Levels.medium) {
      await Future(() {
        var sudokuGenerator = SudokuGenerator(emptySquares: 36);
        emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
      });
    } else {
      await Future(() {
        var sudokuGenerator = SudokuGenerator(emptySquares: 27);
        emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
      });
    }
  }

  FutureOr<void> _onResetNumbersEvent(
      ResetNumbers event, Emitter<SudokuState> emit) {
    emit(SudokuGenerating());
  }
}
