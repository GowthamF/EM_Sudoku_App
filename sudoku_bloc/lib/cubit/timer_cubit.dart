import 'dart:async';

import 'package:bloc/bloc.dart';

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
}

class TimerStateCubit extends Cubit<bool> {
  TimerStateCubit() : super(false);

  void changeTimerState(bool isStart) {
    return emit(isStart);
  }
}
