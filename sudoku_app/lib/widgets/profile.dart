import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_app/sudoku_app.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class Profile extends StatefulWidget {
  final String? userId;
  const Profile({Key? key, this.userId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late LeaderboardBloc _leaderboardBloc;
  String? userId;

  @override
  void initState() {
    super.initState();
    _leaderboardBloc = BlocProvider.of<LeaderboardBloc>(context);
    userId = widget.userId ?? context.read<UserIdCubit>().state;
    _leaderboardBloc.add(GetUserData(levels: Levels.easy, userId: userId!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LevelsChangeCubit, Levels>(
      listener: (context, state) {
        _leaderboardBloc.add(GetUserData(levels: state, userId: userId!));
      },
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is UserdataLoaded) {
            return RefreshIndicator(
              onRefresh: () {
                var selectedLevel = context.read<LevelCubit>().state;
                _leaderboardBloc
                    .add(GetUserData(levels: selectedLevel, userId: userId!));
                return Future.value();
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: ((context, index) {
                  var data = state.userDataList[index];
                  return UserProfile(leaderBoardModel: data);
                }),
                itemCount: state.userDataList.length,
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
