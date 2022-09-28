part of 'leaderboard_bloc.dart';

abstract class LeaderboardState {}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final List<LeaderBoardModel> leaderboardList;

  LeaderboardLoaded({required this.leaderboardList});
}

class UserdataLoading extends LeaderboardState {}

class UserdataLoaded extends LeaderboardState {
  final List<LeaderBoardModel> userDataList;

  UserdataLoaded({required this.userDataList});
}
