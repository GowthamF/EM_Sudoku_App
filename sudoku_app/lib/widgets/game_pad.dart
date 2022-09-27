import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class GamePad extends StatefulWidget {
  const GamePad({Key? key}) : super(key: key);

  @override
  State<GamePad> createState() => _GamePadState();
}

class _GamePadState extends State<GamePad> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerStart>(
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 5,
          children: List.generate(9, (index) {
            return Draggable(
              maxSimultaneousDrags: 1,
              data: index + 1,
              childWhenDragging: const SizedBox(),
              dragAnchorStrategy: pointerDragAnchorStrategy,
              feedback: DraggingListItem(
                dragKey: GlobalKey(),
                photoProvider: index + 1,
              ),
              child: Card(
                margin: const EdgeInsets.all(2),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final int photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Opacity(
            opacity: 0.85,
            child: Card(
              child: Center(
                child: Text(
                  '$photoProvider',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
