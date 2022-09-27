import 'package:sudoku_bloc/sudoku_bloc.dart';

class SudokuRepository {
  final SudokuService sudokuService = SudokuService();

  Future<void> addProgress(Map<String, dynamic> progress) {
    return sudokuService.addProgress(progress);
  }

  Future<void> addNumbers(String numbers) {
    return sudokuService.addNumbers(numbers);
  }
}
