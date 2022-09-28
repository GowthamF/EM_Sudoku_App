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
  }

  FutureOr<void> _onLoadLeaderboardDataEvent(
      LoadLeaderboardData event, Emitter<LeaderboardState> emit) async {
    emit(LeaderboardLoading());
    var leaderboardList = await leaderboardRepository.getLeaderboardData();

    emit(LeaderboardLoaded(leaderboardList: leaderboardList));
  }
}
