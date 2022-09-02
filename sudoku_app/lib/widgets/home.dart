import 'package:flutter/material.dart';
import 'package:sudoku_app/sudoku_app.dart' as app;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku'),
      ),
      drawer: const Drawer(child: app.DrawerScreen()),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: app.SudokuBodyScreen(),
          ),
          const Expanded(
            flex: 0,
            child: app.GameControlsScreen(),
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(10.0),
              child: const app.GamePadScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
