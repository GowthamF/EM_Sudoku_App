part of 'sudoku_bloc.dart';

abstract class SudokuEvent {}

class GenerateNumbers extends SudokuEvent {
  final Levels selectedLevel;

  GenerateNumbers({required this.selectedLevel});
}

class ResetNumbers extends SudokuEvent {}
