import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  late LeaderboardBloc _leaderboardBloc;

  @override
  void initState() {
    super.initState();
    _leaderboardBloc = BlocProvider.of<LeaderboardBloc>(context);
    _leaderboardBloc.add(LoadLeaderboardData(levels: Levels.easy));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LevelsChangeCubit, Levels>(
      listener: (context, state) {
        _leaderboardBloc.add(LoadLeaderboardData(levels: state));
      },
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoaded) {
            return RefreshIndicator(
              onRefresh: () {
                var selectedLevel = context.read<LevelCubit>().state;
                _leaderboardBloc
                    .add(LoadLeaderboardData(levels: selectedLevel));
                return Future.value();
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: ((context, index) {
                  var data = state.leaderboardList[index];
                  return UserProfile(
                    leaderBoardModel: data,
                    openProfile: ((userId) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfileScreen(
                                    userId: userId,
                                  ))));
                    }),
                  );
                }),
                itemCount: state.leaderboardList.length,
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
