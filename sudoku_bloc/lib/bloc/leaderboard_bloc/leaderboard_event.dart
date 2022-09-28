part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent {}

class LoadLeaderboardData extends LeaderboardEvent {
  final Levels levels;

  LoadLeaderboardData({required this.levels});
}

class GetUserData extends LeaderboardEvent {
  final String userId;
  final Levels levels;
  GetUserData({required this.userId, required this.levels});
}
