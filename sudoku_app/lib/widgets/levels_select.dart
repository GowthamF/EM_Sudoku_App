import 'package:flutter/material.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class LevelsSelect extends StatefulWidget {
  final Levels selectedLevel;
  final Function(Levels) selectLevel;
  const LevelsSelect(
      {required this.selectedLevel, required this.selectLevel, Key? key})
      : super(key: key);

  @override
  State<LevelsSelect> createState() => _LevelsSelectState();
}

class _LevelsSelectState extends State<LevelsSelect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: widget.selectedLevel == Levels.easy
                ? const Icon(Icons.looks_one)
                : const Icon(Icons.looks_one_outlined),
            onPressed: () {
              widget.selectLevel(Levels.easy);
            },
            tooltip: 'Easy'),
        IconButton(
            icon: widget.selectedLevel == Levels.medium
                ? const Icon(Icons.looks_two)
                : const Icon(Icons.looks_two_outlined),
            onPressed: () {
              widget.selectLevel(Levels.medium);
            },
            tooltip: 'Medium'),
        IconButton(
            icon: widget.selectedLevel == Levels.hard
                ? const Icon(Icons.looks_3)
                : const Icon(Icons.looks_3_outlined),
            onPressed: () {
              widget.selectLevel(Levels.hard);
            },
            tooltip: 'Hard'),
      ],
    );
  }
}
