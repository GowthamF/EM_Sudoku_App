import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class GameControls extends StatefulWidget {
  const GameControls({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GameControlsState();
  }
}

class _GameControlsState extends State<GameControls> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      children: [
        IconButton(
          onPressed: () {
            context.read<NumbersUndoCubit>().undoCell();
          },
          icon: const Icon(Icons.undo),
          tooltip: 'Undo',
        ),
        IconButton(
          onPressed: () {
            context.read<TimerCubit>().stopTimer();
          },
          icon: const Icon(Icons.clear),
          tooltip: 'Erase',
        ),
        BlocConsumer<TimerStateCubit, bool>(
          listener: (context, state) {
            if (state) {
              context.read<TimerCubit>().startTimer();
            } else {
              context.read<TimerCubit>().stopTimer();
            }
          },
          builder: (context, state) {
            return IconButton(
              tooltip: state ? 'Pause' : 'Play',
              onPressed: () {
                var timerState = context.read<TimerStateCubit>().state;
                if (timerState) {
                  context.read<TimerStateCubit>().changeTimerState(false);
                } else {
                  context.read<TimerStateCubit>().changeTimerState(true);
                }
              },
              icon: state
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
            );
          },
        ),
      ],
    );
  }
}
