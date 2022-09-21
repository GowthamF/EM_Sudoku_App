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
        RepositoryProvider<SharedPreferenceRepository>(
          create: (context) => SharedPreferenceRepository(),
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
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<NumbersCubit>(
            create: (context) => NumbersCubit(),
          ),
          BlocProvider<NumbersUndoCubit>(
            create: (context) => NumbersUndoCubit(),
          ),
          BlocProvider<LevelsChangeCubit>(
            create: (context) => LevelsChangeCubit(),
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
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<SudokuBloc>(
              create: (context) => SudokuBloc(),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
