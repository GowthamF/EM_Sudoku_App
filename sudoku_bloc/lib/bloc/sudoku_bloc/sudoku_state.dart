part of 'sudoku_bloc.dart';

abstract class SudokuState {}

class SudokuInitial extends SudokuState {}

class SudokuGenerating extends SudokuState {}

class SudokuGenerated extends SudokuState {
  final List<List<int>> numbers;
  final Levels selectedLevel;
  final List<NumbersTrackModel> numbersTracker;
  final Duration trackedDuration;

  SudokuGenerated({
    required this.numbers,
    required this.selectedLevel,
    this.trackedDuration = const Duration(),
    this.numbersTracker = const [],
  });
}

class SudokuValidating extends SudokuState {}

class SudokuValidated extends SudokuState {}
