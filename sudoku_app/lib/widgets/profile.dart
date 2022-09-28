import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

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
    userId = context.read<UserIdCubit>().state;
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
          if (state is LeaderboardLoaded) {
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
                  var data = state.leaderboardList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white70,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://robohash.org/${data.userName}',
                      ),
                    ),
                    title: Text(data.userName),
                    trailing: Text(
                        data.duration.toString().split('.')[0].padLeft(8, '0')),
                    subtitle: Text('${data.country} | ${data.playedDateTime}'),
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
