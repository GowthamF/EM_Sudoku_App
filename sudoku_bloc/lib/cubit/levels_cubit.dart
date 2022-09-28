import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class LevelsCubit extends Cubit<bool> {
  LevelsCubit() : super(true);

  void hasExpanded() {
    return emit(!state);
  }
}

class LevelsChangeCubit extends Cubit<Levels> {
  LevelsChangeCubit() : super(Levels.easy);

  void changeLevels(Levels level) {
    return emit(level);
  }
}

class LevelCubit extends Cubit<Levels> {
  LevelCubit() : super(Levels.easy);

  void changeLevel(Levels level) {
    return emit(level);
  }
}
