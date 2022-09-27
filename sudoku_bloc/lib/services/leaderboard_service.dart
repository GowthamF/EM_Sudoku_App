import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sudoku_bloc/common/enums.dart';

class LeaderboardService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getLeaderboardData() async {
    try {
      var documents = await firebaseFirestore
          .collection(Collections.leaderBoard.name)
          .orderBy('duration', descending: true)
          .get();
      //documents.docs
    } catch (e) {}
  }

  Future<void> addNumbers(String numbers) async {
    try {
      var document = await firebaseFirestore
          .collection(Collections.sudokuNumbers.name)
          .add({"numbers": numbers});
    } catch (e) {}
  }
}
