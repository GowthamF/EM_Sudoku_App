import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart' as app;
import 'package:sudoku_bloc/sudoku_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UserNameGenerateBloc _userNameGenerateBloc;
  late InstructionsBloc _instructionsBloc;
  late LocationBloc _locationBloc;
  late SudokuProgressBloc _sudokuProgressBloc;
  late SudokuBloc _sudokuBloc;

  @override
  void initState() {
    super.initState();
    _userNameGenerateBloc = BlocProvider.of<UserNameGenerateBloc>(context);
    _instructionsBloc = BlocProvider.of<InstructionsBloc>(context);
    _locationBloc = BlocProvider.of<LocationBloc>(context);
    _sudokuProgressBloc = BlocProvider.of<SudokuProgressBloc>(context);
    _sudokuBloc = BlocProvider.of<SudokuBloc>(context);

    _userNameGenerateBloc.add(GenerateUserName());
    _instructionsBloc.add(GetInstructions());
    _locationBloc.add(GetLocationAddress());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InstructionsBloc, InstructionsState>(
      listener: (context, state) {
        if (state is InstructionsNotNotified) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Tips'),
                  content: const Text('Drag Numbers in the Pad to Sudoku Card'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
      },
      child: BlocConsumer<UserNameGenerateBloc, UserNameGenerateState>(
        listener: (context, state) {
          if (state is UserNameGenerateLoaded) {
            context.read<UserNameCubit>().changeUserName(state.userName);
          }
        },
        builder: (context, state) {
          if (state is UserNameGenerateLoaded) {
            return BlocListener<SudokuValidationBloc, SudokuValidationState>(
              listener: (context, state) {
                if (state is SudokuValidationNotCompleted) {
                  var snackBar = const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Not all the empty squares are filled'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (state is SudokuValidationNotEqual) {
                  var snackBar = const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Please check each rows and columns'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (state is SudokuValidationEqual) {
                  var snackBar = const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Congratulations'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  _sudokuBloc.add(ResetNumbers());
                  var selectedLevel = context.read<LevelCubit>().state;
                  _sudokuBloc.add(GenerateNumbers(
                      selectedLevel: selectedLevel, isInitial: true));
                  context.read<TimerCubit>().stopTimer();
                  context.read<TimerCubit>().resetTimer();
                  context
                      .read<TimerStateCubit>()
                      .changeTimerState(TimerStart.initial);
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Sudoku'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: BlocBuilder<LevelsChangeCubit, Levels>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star),
                              state == Levels.medium || state == Levels.hard
                                  ? const Icon(Icons.star)
                                  : const Icon(Icons.star_border_outlined),
                              state == Levels.hard
                                  ? const Icon(Icons.star)
                                  : const Icon(Icons.star_border_outlined),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
                drawer: const Drawer(child: app.DrawerScreen()),
                body: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.all(16),
                                  child: BlocConsumer<TimerCubit, Duration>(
                                    listener: (context, state) {
                                      _sudokuProgressBloc
                                          .add(SaveDuration(duration: state));
                                    },
                                    builder: (context, state) {
                                      return Text(state
                                          .toString()
                                          .split('.')[0]
                                          .padLeft(8, '0'));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: app.SudokuBodyScreen(),
                    ),
                    Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          const app.GameControlsScreen(),
                          Container(
                            height: 200,
                            padding: const EdgeInsets.all(10.0),
                            child: const app.GamePadScreen(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
