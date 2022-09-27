import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sudoku_bloc/common/enums.dart';

class SudokuService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addProgress(Map<String, dynamic> progress) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      progress['userId'] = userId;
      var document = await firebaseFirestore
          .collection(Collections.sudokuProgress.name)
          .add(progress);
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
