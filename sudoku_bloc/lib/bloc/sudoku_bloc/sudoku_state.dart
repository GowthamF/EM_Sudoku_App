part of 'sudoku_bloc.dart';

abstract class SudokuState {}

class SudokuInitial extends SudokuState {}

class SudokuGenerating extends SudokuState {}

class SudokuGenerated extends SudokuState {
  final List<List<int>> numbers;

  SudokuGenerated({required this.numbers});
}
