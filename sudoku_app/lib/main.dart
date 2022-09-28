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
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<FirebaseRepository>(
          create: (context) => FirebaseRepository(),
        ),
        RepositoryProvider<SudokuRepository>(
          create: (context) => SudokuRepository(),
        ),
        RepositoryProvider<LeaderboardRepository>(
          create: (context) => LeaderboardRepository(),
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
          BlocProvider<LevelCubit>(
            create: (context) => LevelCubit(),
          ),
          BlocProvider<SudokuNumbersCubit>(
            create: (context) => SudokuNumbersCubit(),
          ),
          BlocProvider<UserIdCubit>(
            create: (context) => UserIdCubit(),
          ),
          BlocProvider<CountryNameCubit>(
            create: (context) => CountryNameCubit(),
          ),
          BlocProvider<SudokuNumbersInitialCubit>(
            create: (context) => SudokuNumbersInitialCubit(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserNameGenerateBloc>(
              create: (context) => UserNameGenerateBloc(
                userNameGeneratorRepository:
                    RepositoryProvider.of<UserNameGeneratorRepository>(context),
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<SudokuBloc>(
              create: (context) => SudokuBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<InstructionsBloc>(
              create: (context) => InstructionsBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<LocationBloc>(
              create: (context) => LocationBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context),
              ),
            ),
            BlocProvider<FirebaseBloc>(
              create: (context) => FirebaseBloc(
                firebaseRepository:
                    RepositoryProvider.of<FirebaseRepository>(context),
              ),
            ),
            BlocProvider<SudokuProgressBloc>(
              create: (context) => SudokuProgressBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
              ),
            ),
            BlocProvider<SudokuValidationBloc>(
              create: (context) => SudokuValidationBloc(
                sharedPreferenceRepository:
                    RepositoryProvider.of<SharedPreferenceRepository>(context),
                sudokuRepository:
                    RepositoryProvider.of<SudokuRepository>(context),
              ),
            ),
            BlocProvider<LeaderboardBloc>(
              create: (context) => LeaderboardBloc(
                leaderboardRepository:
                    RepositoryProvider.of<LeaderboardRepository>(context),
              ),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
