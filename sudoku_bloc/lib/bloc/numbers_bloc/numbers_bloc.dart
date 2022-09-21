import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

part 'numbers_event.dart';
part 'numbers_state.dart';

class NumbersBloc extends Bloc<NumbersEvent, NumbersState> {
  NumbersBloc() : super(NumbersInitial()) {
    on<GenerateNumbers>(_onGenerateNumbersEvent);
  }

  FutureOr<void> _onGenerateNumbersEvent(
      GenerateNumbers event, Emitter<NumbersState> emit) async {
    if (event.selectedLevel == Levels.hard) {
      var sudokuGenerator = SudokuGenerator(emptySquares: 54);

      emit(NumbersGenerated(numbers: sudokuGenerator.newSudoku));
    } else if (event.selectedLevel == Levels.medium) {
      var sudokuGenerator = SudokuGenerator(emptySquares: 36);

      emit(NumbersGenerated(numbers: sudokuGenerator.newSudoku));
    } else {
      var sudokuGenerator = SudokuGenerator(emptySquares: 27);

      emit(NumbersGenerated(numbers: sudokuGenerator.newSudoku));
    }
  }
}
