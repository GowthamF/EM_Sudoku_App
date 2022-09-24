import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class TimerCubit extends Cubit<Duration> {
  TimerCubit() : super(const Duration());

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      return emit(Duration(seconds: state.inSeconds + 1));
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  void resetTimer() {
    return emit(const Duration());
  }

  void changeTimerDuration(Duration duration) {
    return emit(duration);
  }
}

class TimerStateCubit extends Cubit<TimerStart> {
  TimerStateCubit() : super(TimerStart.initial);

  void changeTimerState(TimerStart timerStart) {
    return emit(timerStart);
  }
}
