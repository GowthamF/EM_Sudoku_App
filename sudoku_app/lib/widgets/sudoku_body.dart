import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class SudokuBody extends StatefulWidget {
  const SudokuBody({Key? key}) : super(key: key);

  @override
  State<SudokuBody> createState() => _SudokuBodyState();
}

class _SudokuBodyState extends State<SudokuBody> with TickerProviderStateMixin {
  late NumbersBloc numbersBloc;

  List<NumbersTrackModel> trackingNumbers = [];

  @override
  void initState() {
    super.initState();
    numbersBloc = BlocProvider.of<NumbersBloc>(context);
    numbersBloc.add(GenerateNumbers(selectedLevel: Levels.easy));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return BlocBuilder<NumbersBloc, NumbersState>(
      builder: (context, state) {
        if (state is NumbersGenerated) {
          var numbers = state.numbers.toList();
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

                    return DragTarget<int>(
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
                        if (trackingNumbers.isEmpty) {
                          context.read<TimerStateCubit>().changeTimerState();
                        }
                        numbers[listIndex][index % 9] = value;

                        trackingNumbers.add(NumbersTrackModel(
                            listIndex: listIndex, index: index, value: value));
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
    );
  }
}
