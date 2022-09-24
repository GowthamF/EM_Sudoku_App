part of 'sudoku_progress_bloc.dart';

abstract class SudokuProgressState {}

class SudokuProgressInitial extends SudokuProgressState {}

class SudokuProgressSaving extends SudokuProgressState {}

class SudokuProgressSaved extends SudokuProgressState {}

class SudokuDurationSaving extends SudokuProgressState {}

class SudokuDurationSaved extends SudokuProgressState {}
