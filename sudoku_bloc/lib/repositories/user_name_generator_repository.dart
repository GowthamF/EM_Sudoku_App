import 'package:sudoku_bloc/sudoku_bloc.dart';

class UserNameGeneratorRepository {
  final UserNameGeneratorService _userNameGeneratorService =
      UserNameGeneratorService();

  Future<UserGenerateModel> generateUserName() {
    return _userNameGeneratorService.generateUserName();
  }
}
