import 'package:flutter/material.dart';
import 'package:sudoku_app/sudoku_app.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leader Board')),
      body: const LeaderBoard(),
    );
  }
}
