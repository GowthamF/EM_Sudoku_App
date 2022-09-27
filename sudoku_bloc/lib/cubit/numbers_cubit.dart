import 'package:bloc/bloc.dart';

class NumbersCubit extends Cubit<bool> {
  NumbersCubit() : super(false);

  void changeOfCell() {
    return emit(!state);
  }
}

class NumbersUndoCubit extends Cubit<bool> {
  NumbersUndoCubit() : super(false);

  void undoCell() {
    return emit(!state);
  }
}

class SudokuNumbersCubit extends Cubit<List<List<int>>> {
  SudokuNumbersCubit() : super(const []);

  void updateChanges(List<List<int>> numbers) {
    return emit(numbers);
  }
}
