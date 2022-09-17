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

  @override
  void initState() {
    super.initState();
    _userNameGenerateBloc = BlocProvider.of<UserNameGenerateBloc>(context);
    _userNameGenerateBloc.add(GenerateUserName());
    // context.read<TimerCubit>().startTimer();

    // WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: const Text('Tips'),
    //           content: const Text('Drag Numbers in the Pad to Sudoku Card'),
    //           actions: <Widget>[
    //             TextButton(
    //               child: const Text('Ok'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ],
    //         );
    //       });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserNameGenerateBloc, UserNameGenerateState>(
      listener: (context, state) {
        if (state is UserNameGenerateLoaded) {
          context.read<UserNameCubit>().changeUserName(state.userName);

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
      builder: (context, state) {
        if (state is UserNameGenerateLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Sudoku'),
            ),
            drawer: const Drawer(child: app.DrawerScreen()),
            body: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<TimerCubit, Duration>(
                      builder: (context, state) {
                        return Text(
                            state.toString().split('.')[0].padLeft(8, '0'));
                      },
                    ),
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
          );
        }

        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
