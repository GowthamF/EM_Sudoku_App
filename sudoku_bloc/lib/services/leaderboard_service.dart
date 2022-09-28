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

  Future<void> addNumbers(String numbers) async {
    try {
      var document = await firebaseFirestore
          .collection(Collections.sudokuNumbers.name)
          .add({"numbers": numbers});
    } catch (e) {}
  }
}
