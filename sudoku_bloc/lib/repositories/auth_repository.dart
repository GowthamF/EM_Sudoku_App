import 'package:sudoku_bloc/sudoku_bloc.dart';

class AuthRepository {
  final AuthService authService = AuthService();

  Future<String> signInAnonymously() {
    return authService.signInAnonymously();
  }

  String userId() {
    return authService.userId();
  }
}
