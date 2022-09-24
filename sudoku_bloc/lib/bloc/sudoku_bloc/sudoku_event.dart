part of 'sudoku_bloc.dart';

abstract class SudokuEvent {}

class GenerateNumbers extends SudokuEvent {
  final Levels selectedLevel;
  final bool isInitial;

  GenerateNumbers({required this.selectedLevel, required this.isInitial});
}

class ResetNumbers extends SudokuEvent {}

class ValidateNumbers extends SudokuEvent {
  final List<List<int>> sudokuNumbers;

  ValidateNumbers({required this.sudokuNumbers});
}
