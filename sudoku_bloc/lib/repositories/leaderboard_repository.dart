import 'package:sudoku_bloc/services/leaderboard_service.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class LeaderboardRepository {
  final LeaderboardService leaderboardService = LeaderboardService();

  Future<List<LeaderBoardModel>> getLeaderboardData(Levels level) {
    return leaderboardService.getLeaderboardData(level);
  }

  Future<List<LeaderBoardModel>> getUserData(Levels level, String userId) {
    return leaderboardService.getUserData(level, userId);
  }
}
