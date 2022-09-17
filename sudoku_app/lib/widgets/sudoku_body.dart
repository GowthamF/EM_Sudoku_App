import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class SudokuBody extends StatefulWidget {
  const SudokuBody({Key? key}) : super(key: key);

  @override
  State<SudokuBody> createState() => _SudokuBodyState();
}

class _SudokuBodyState extends State<SudokuBody> with TickerProviderStateMixin {
  Map<int, int> numbers = {};

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      shrinkWrap: true,
      children: List.generate(81, (index) {
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
                  '${numbers[index] ?? ''}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            );
          }),
          onAccept: (value) {
            if (numbers.isEmpty) {
              context.read<TimerStateCubit>().changeTimerState();
            }
            setState(() {
              numbers[index] = value;
            });
          },
        );
      }),
    );
  }
}
