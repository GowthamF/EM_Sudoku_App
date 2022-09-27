import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'sudoku_validation_event.dart';
part 'sudoku_validation_state.dart';

class SudokuValidationBloc
    extends Bloc<SudokuValidationEvent, SudokuValidationState> {
  final SharedPreferenceRepository sharedPreferenceRepository;

  SudokuValidationBloc({required this.sharedPreferenceRepository})
      : super(SudokuValidationInitial()) {
    on<SudokuValidateNumbers>(_onSudokuValidateNumbersEvent);
  }

  FutureOr<void> _onSudokuValidateNumbersEvent(
      SudokuValidateNumbers event, Emitter<SudokuValidationState> emit) async {
    if (event.sudokuNumbers.isNotEmpty) {
      var solvedSudoku =
          await sharedPreferenceRepository.getString(key: solvedSudokuKey);

      if (solvedSudoku != null) {
        var sudokuList = jsonDecode(solvedSudoku);

        var sudokuSolvedListInt =
            List.from(sudokuList).map((e) => List<int>.from(e)).toList();

        List<NumbersTrackModel> wrongNumbers = [];
        var isSudokuCompleted = true;

        for (var i = 0; i < sudokuSolvedListInt.length; i++) {
          for (var j = 0; j < sudokuSolvedListInt[i].length; j++) {
            if (event.sudokuNumbers[j].contains(0)) {
              isSudokuCompleted = false;
              break;
            } else if (sudokuSolvedListInt[i][j] != event.sudokuNumbers[i][j]) {
              wrongNumbers.add(
                NumbersTrackModel(
                    listIndex: i, index: j, value: event.sudokuNumbers[i][j]),
              );
            }
          }
        }

        if (!isSudokuCompleted) {
          emit(SudokuValidationNotCompleted());
        } else {
          if (wrongNumbers.isNotEmpty) {
            emit(SudokuValidationNotEqual());
          } else {
            await sharedPreferenceRepository.setString(
                key: unSolvedSudokuKey, value: '[]');
            await sharedPreferenceRepository.setString(
                key: solvedSudokuKey, value: '[]');
            await sharedPreferenceRepository.setString(
                key: sudokuProgressKey, value: '[]');
            emit(SudokuValidationEqual());
          }
        }
      }
    }
  }
}
