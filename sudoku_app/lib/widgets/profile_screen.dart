import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final String? userId;
  const ProfileScreen({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LeaderboardBloc>(
          create: (context) => LeaderboardBloc(
            leaderboardRepository:
                RepositoryProvider.of<LeaderboardRepository>(context),
          ),
        ),
        BlocProvider<LevelsChangeCubit>(
          create: (context) => LevelsChangeCubit(),
        ),
        BlocProvider<LevelCubit>(
          create: (context) => LevelCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
            title: Text(userId == null ? 'My Profile' : "Profile"),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: BlocBuilder<LevelsChangeCubit, Levels>(
                        builder: (context, state) {
                          return LevelsSelect(
                            selectedLevel: state,
                            selectLevel: (level) {
                              context
                                  .read<LevelsChangeCubit>()
                                  .changeLevels(level);
                              context.read<LevelCubit>().changeLevel(level);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
        body: Profile(userId: userId),
      ),
    );
  }
}
