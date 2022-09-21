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
