import 'package:flutter/material.dart';

class SudokuBody extends StatefulWidget {
  const SudokuBody({Key? key}) : super(key: key);

  @override
  State<SudokuBody> createState() => _SudokuBodyState();
}

class _SudokuBodyState extends State<SudokuBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      shrinkWrap: true,
      children: List.generate(81, (index) {
        return Card(
          child: Center(
            child: Text(
              '$index',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }),
    );
  }
}
