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
  late SudokuBloc sudokuBloc;
  late SudokuValidationBloc sudokuValidationBloc;

  @override
  void initState() {
    super.initState();
    sudokuBloc = BlocProvider.of<SudokuBloc>(context);
    sudokuValidationBloc = BlocProvider.of<SudokuValidationBloc>(context);
  }

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
            sudokuBloc.add(ResetNumbers());
          },
          icon: const Icon(Icons.restart_alt),
          tooltip: 'Reset',
        ),
        IconButton(
          onPressed: () {
            var currentSudokuNumbers = context.read<SudokuNumbersCubit>().state;
            var duration = context.read<TimerCubit>().state;
            var countryName = context.read<CountryNameCubit>().state;
            var userName = context.read<UserNameCubit>().state;
            var userId = context.read<UserIdCubit>().state;
            var selectedLevel = context.read<LevelCubit>().state;
            sudokuValidationBloc.add(
              SudokuValidateNumbers(
                sudokuNumbers: currentSudokuNumbers,
                leaderBoardModel: LeaderBoardModel(
                  country: countryName ?? '',
                  duration: duration.toString(),
                  userId: userId ?? '',
                  userName: userName ?? '',
                  levels: selectedLevel,
                  playedDateTime:
                      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                ),
              ),
            );
          },
          icon: const Icon(Icons.done),
          tooltip: 'Validate',
        ),
        BlocConsumer<TimerStateCubit, TimerStart>(
          listener: (context, state) {
            if (state == TimerStart.start) {
              context.read<TimerCubit>().startTimer();
            } else {
              context.read<TimerCubit>().stopTimer();
            }
          },
          builder: (context, state) {
            return IconButton(
              tooltip:
                  (state == TimerStart.pause || state == TimerStart.initial)
                      ? 'Play'
                      : 'Pause',
              onPressed: () {
                var timerState = context.read<TimerStateCubit>().state;
                if (timerState == TimerStart.start) {
                  context
                      .read<TimerStateCubit>()
                      .changeTimerState(TimerStart.pause);
                } else {
                  context
                      .read<TimerStateCubit>()
                      .changeTimerState(TimerStart.start);
                }
              },
              icon: state == TimerStart.pause
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
            );
          },
        ),
      ],
    );
  }
}
