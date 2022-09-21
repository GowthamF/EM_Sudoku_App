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
          onPressed: () {},
          icon: const Icon(Icons.visibility),
          tooltip: 'Hint',
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
            if (!state) {
              context.read<TimerCubit>().startTimer();
            } else {
              context.read<TimerCubit>().stopTimer();
            }
          },
          builder: (context, state) {
            return IconButton(
              tooltip: state ? 'Play' : 'Pause',
              onPressed: () {
                context.read<TimerStateCubit>().changeTimerState();
              },
              icon: state
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
            );
          },
        ),
      ],
    );
  }
}
