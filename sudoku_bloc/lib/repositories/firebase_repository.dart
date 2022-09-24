import 'package:sudoku_bloc/sudoku_bloc.dart';

class FirebaseRepository {
  final FirebaseService firebaseService = FirebaseService();

  Future<bool> connectToFirebase() {
    return firebaseService.connectToFirebase();
  }
}
