import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserNameGeneratorRepository>(
          create: (context) => UserNameGeneratorRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TimerCubit>(
            create: (context) => TimerCubit(),
          ),
          BlocProvider<TimerStateCubit>(
            create: (context) => TimerStateCubit(),
          ),
          BlocProvider<LevelsCubit>(
            create: (context) => LevelsCubit(),
          ),
          BlocProvider<UserNameCubit>(
            create: (context) => UserNameCubit(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserNameGenerateBloc>(
              create: (context) => UserNameGenerateBloc(
                userNameGeneratorRepository:
                    RepositoryProvider.of<UserNameGeneratorRepository>(context),
              ),
            ),
          ],
          child: MaterialApp(
            darkTheme: ThemeData.dark(),
            theme: ThemeData(),
            themeMode: ThemeMode.light,
            home: const Home(),
          ),
        ),
      ),
    );
  }
}
