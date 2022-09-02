import 'package:flutter/material.dart';
import 'package:sudoku_app/sudoku_app.dart' as app;

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const app.Drawer();
  }
}
