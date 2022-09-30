import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sudoku_bloc/common/enums.dart';

class SudokuService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addProgress(Map<String, dynamic> progress) async {
    try {
      await firebaseFirestore
          .collection(Collections.leaderBoard.name)
          .add(progress);
    } catch (e) {
      return;
    }
  }

  Future<void> addNumbers(String numbers) async {
    try {
      await firebaseFirestore
          .collection(Collections.sudokuNumbers.name)
          .add({"numbers": numbers});
    } catch (e) {
      return;
    }
  }
}
