part of 'sudoku_validation_bloc.dart';

abstract class SudokuValidationEvent {}

class SudokuValidateNumbers extends SudokuValidationEvent {
  final List<List<int>> sudokuNumbers;
  final LeaderBoardModel leaderBoardModel;

  SudokuValidateNumbers(
      {required this.sudokuNumbers, required this.leaderBoardModel});
}
