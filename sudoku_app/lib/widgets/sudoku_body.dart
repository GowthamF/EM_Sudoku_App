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
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Card(
          child: Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }),
    );
  }
}
