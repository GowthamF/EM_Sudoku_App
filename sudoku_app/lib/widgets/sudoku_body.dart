import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';
import 'package:collection/collection.dart';

class SudokuBody extends StatefulWidget {
  const SudokuBody({Key? key}) : super(key: key);

  @override
  State<SudokuBody> createState() => _SudokuBodyState();
}

class _SudokuBodyState extends State<SudokuBody> with TickerProviderStateMixin {
  late SudokuBloc sudokuBloc;

  @override
  void initState() {
    super.initState();
    sudokuBloc = BlocProvider.of<SudokuBloc>(context);
    sudokuBloc.add(GenerateNumbers(selectedLevel: Levels.easy));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return BlocListener<LevelsChangeCubit, Levels>(
      listener: (context, state) {
        sudokuBloc.add(ResetNumbers());
        Future.delayed(const Duration(milliseconds: 500), () {
          sudokuBloc.add(GenerateNumbers(selectedLevel: state));
        });
        context.read<TimerCubit>().resetTimer();
      },
      child: BlocBuilder<SudokuBloc, SudokuState>(
        builder: (context, state) {
          if (state is SudokuGenerated) {
            context.read<LevelCubit>().changeLevel(state.selectedLevel);
            var numbers = state.numbers.toList();
            List<NumbersTrackModel> trackingNumbers = [];
            List<NumbersTrackModel> indexesWithZero = [];
            return BlocListener<NumbersUndoCubit, bool>(
              listener: (context, state) {
                if (trackingNumbers.isNotEmpty) {
                  var lastInserted = trackingNumbers.last;

                  numbers[lastInserted.listIndex][lastInserted.index % 9] = 0;

                  trackingNumbers.removeLast();

                  context.read<NumbersCubit>().changeOfCell();
                }
              },
              child: BlocBuilder<NumbersCubit, bool>(
                builder: (context, state) {
                  return GridView.count(
                    crossAxisCount: numbers.length,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    children:
                        List.generate(numbers.length * numbers.length, (index) {
                      int value = 0;

                      var listIndex = (index / 9).floor();

                      value = numbers[listIndex][index % 9];

                      if (value == 0) {
                        indexesWithZero.add(NumbersTrackModel(
                            listIndex: listIndex, index: index, value: value));
                      }

                      return DragTarget<int>(
                        onWillAccept: ((data) {
                          var timerState =
                              context.read<TimerStateCubit>().state;
                          if (timerState == TimerStart.initial ||
                              timerState == TimerStart.pause) {
                            context
                                .read<TimerStateCubit>()
                                .changeTimerState(TimerStart.start);
                          }

                          var isPrefilled = indexesWithZero.firstWhereOrNull(
                              (element) =>
                                  element.listIndex == listIndex &&
                                  element.index == index);
                          if (isPrefilled != null) {
                            return true;
                          }

                          return false;
                        }),
                        builder: ((context, candidateData, rejectedData) {
                          return Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            color: candidateData.isNotEmpty
                                ? Colors.blueAccent
                                : appTheme.brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black54,
                            child: Center(
                              child: Text(
                                '${value == 0 ? '' : value}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          );
                        }),
                        onAccept: (value) {
                          numbers[listIndex][index % 9] = value;

                          trackingNumbers.add(NumbersTrackModel(
                              listIndex: listIndex,
                              index: index,
                              value: value));
                          context.read<NumbersCubit>().changeOfCell();
                        },
                      );
                    }),
                  );
                },
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
