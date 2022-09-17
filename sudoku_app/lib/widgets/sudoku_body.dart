import 'package:flutter/material.dart';

class SudokuBody extends StatefulWidget {
  const SudokuBody({Key? key}) : super(key: key);

  @override
  State<SudokuBody> createState() => _SudokuBodyState();
}

class _SudokuBodyState extends State<SudokuBody> with TickerProviderStateMixin {
  Map<int, int> numbers = {};

  @override
  Widget build(BuildContext context) {
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
              color:
                  candidateData.isNotEmpty ? Colors.blueAccent : Colors.white,
              child: Center(
                child: Text(
                  '${numbers[index] ?? ''}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            );
          }),
          onAccept: (value) {
            setState(() {
              numbers[index] = value;
            });
          },
        );
      }),
    );
  }
}
