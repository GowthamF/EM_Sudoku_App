import 'package:bloc/bloc.dart';

class LevelsCubit extends Cubit<bool> {
  LevelsCubit() : super(false);

  void hasExpanded() {
    return emit(!state);
  }
}
