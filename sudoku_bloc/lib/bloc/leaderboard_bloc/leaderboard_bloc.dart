import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final LeaderboardRepository leaderboardRepository;
  LeaderboardBloc({required this.leaderboardRepository})
      : super(LeaderboardInitial()) {
    on<LoadLeaderboardData>(_onLoadLeaderboardDataEvent);
    on<GetUserData>(_onGetUserDataEvent);
  }

  FutureOr<void> _onLoadLeaderboardDataEvent(
      LoadLeaderboardData event, Emitter<LeaderboardState> emit) async {
    emit(LeaderboardLoading());
    var leaderboardList =
        await leaderboardRepository.getLeaderboardData(event.levels);

    emit(LeaderboardLoaded(leaderboardList: leaderboardList));
  }

  FutureOr<void> _onGetUserDataEvent(
      GetUserData event, Emitter<LeaderboardState> emit) async {
    emit(UserdataLoading());
    var leaderboardList =
        await leaderboardRepository.getUserData(event.levels, event.userId);

    emit(UserdataLoaded(userDataList: leaderboardList));
  }
}
