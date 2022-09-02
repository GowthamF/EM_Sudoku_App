import 'package:flutter/material.dart';
import 'package:sudoku_app/sudoku_app.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.white,
      ),
    );
  }
}
