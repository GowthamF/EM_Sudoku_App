part of 'sudoku_progress_bloc.dart';

abstract class SudokuProgressEvent {}

class SaveProgress extends SudokuProgressEvent {
  final List<List<int>> sudokuNumbers;
  final List<NumbersTrackModel> trackingNumbers;

  SaveProgress({
    required this.sudokuNumbers,
    required this.trackingNumbers,
  });
}

class SaveDuration extends SudokuProgressEvent {
  final Duration duration;

  SaveDuration({required this.duration});
}
