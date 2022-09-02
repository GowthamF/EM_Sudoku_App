import 'package:flutter/material.dart';

class GamePad extends StatefulWidget {
  const GamePad({Key? key}) : super(key: key);

  @override
  State<GamePad> createState() => _GamePadState();
}

class _GamePadState extends State<GamePad> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: List.generate(10, (index) {
        return Card(
          child: Center(
            child: Text(
              '${index + 1}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }),
    );
  }
}
