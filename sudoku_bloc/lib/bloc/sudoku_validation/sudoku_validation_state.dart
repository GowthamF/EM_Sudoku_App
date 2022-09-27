part of 'sudoku_validation_bloc.dart';

abstract class SudokuValidationState {}

class SudokuValidationInitial extends SudokuValidationState {}

class SudokuValidationLoading extends SudokuValidationState {}

class SudokuValidationLoaded extends SudokuValidationState {}

class SudokuValidationNotCompleted extends SudokuValidationState {}

class SudokuValidationNotEqual extends SudokuValidationState {}

class SudokuValidationEqual extends SudokuValidationState {}
