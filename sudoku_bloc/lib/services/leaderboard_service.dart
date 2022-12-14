import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sudoku_bloc/sudoku_bloc.dart';

class LeaderboardService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<LeaderBoardModel>> getLeaderboardData(Levels level) async {
    try {
      var documents = await firebaseFirestore
          .collection(Collections.leaderBoard.name)
          .where('level', isEqualTo: level.name)
          .orderBy('duration')
          .get();
      var data = documents.docs
          .map((e) => LeaderBoardModel.fromJson(e.data()))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<List<LeaderBoardModel>> getUserData(
      Levels level, String userId) async {
    try {
      var documents = await firebaseFirestore
          .collection(Collections.leaderBoard.name)
          .where('userId', isEqualTo: userId)
          .where('level', isEqualTo: level.name)
          .orderBy('duration')
          .get();
      var data = documents.docs
          .map((e) => LeaderBoardModel.fromJson(e.data()))
          .toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
