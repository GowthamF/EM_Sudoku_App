import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

part 'sudoku_event.dart';
part 'sudoku_state.dart';

class SudokuBloc extends Bloc<SudokuEvent, SudokuState> {
  final SharedPreferenceRepository sharedPreferenceRepository;

  SudokuBloc({required this.sharedPreferenceRepository})
      : super(SudokuInitial()) {
    on<GenerateNumbers>(_onGenerateNumbersEvent);
    on<ResetNumbers>(_onResetNumbersEvent);
  }

  FutureOr<void> _onGenerateNumbersEvent(
      GenerateNumbers event, Emitter<SudokuState> emit) async {
    var sudoku =
        await sharedPreferenceRepository.getString(key: unSolvedSudokuKey);

    if (sudoku != null) {
      var sudokuList = jsonDecode(sudoku);
      var intList = List<dynamic>.from(sudokuList);
      var intList1 = List<List<int>>.generate(intList.length, (index) {
        var value = intList[index];

        return [];
      });
      // emit(SudokuGenerated(numbers: intList));
    } else {
      if (event.selectedLevel == Levels.hard) {
        await Future(() async {
          var sudokuGenerator = SudokuGenerator(emptySquares: 54);
          await sharedPreferenceRepository.setString(
              key: unSolvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudoku));
          await sharedPreferenceRepository.setString(
              key: solvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudokuSolved));
          emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
        });
      } else if (event.selectedLevel == Levels.medium) {
        await Future(() async {
          var sudokuGenerator = SudokuGenerator(emptySquares: 36);
          await sharedPreferenceRepository.setString(
              key: unSolvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudoku));
          await sharedPreferenceRepository.setString(
              key: solvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudokuSolved));
          emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
        });
      } else {
        await Future(() async {
          var sudokuGenerator = SudokuGenerator(emptySquares: 27);
          await sharedPreferenceRepository.setString(
              key: unSolvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudoku));
          await sharedPreferenceRepository.setString(
              key: solvedSudokuKey,
              value: jsonEncode(sudokuGenerator.newSudokuSolved));
          emit(SudokuGenerated(numbers: sudokuGenerator.newSudoku));
        });
      }
    }
  }

  FutureOr<void> _onResetNumbersEvent(
      ResetNumbers event, Emitter<SudokuState> emit) {
    emit(SudokuGenerating());
  }
}
