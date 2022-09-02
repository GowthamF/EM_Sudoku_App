import 'package:flutter/material.dart';

class GameControls extends StatefulWidget {
  const GameControls({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GameControlsState();
  }
}

class _GameControlsState extends State<GameControls> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.undo),
          tooltip: 'Undo',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility),
          tooltip: 'Hint',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
          tooltip: 'Erase',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
