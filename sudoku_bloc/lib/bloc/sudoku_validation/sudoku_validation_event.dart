part of 'sudoku_validation_bloc.dart';

abstract class SudokuValidationEvent {}

class SudokuValidateNumbers extends SudokuValidationEvent {
  final List<List<int>> sudokuNumbers;

  SudokuValidateNumbers({required this.sudokuNumbers});
}
