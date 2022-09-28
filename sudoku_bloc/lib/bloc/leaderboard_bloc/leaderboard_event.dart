part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent {}

class LoadLeaderboardData extends LeaderboardEvent {
  final Levels levels;

  LoadLeaderboardData({required this.levels});
}
