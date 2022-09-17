import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sudoku_bloc/sudoku_bloc.dart';

class UserNameGeneratorService {
  final Uri _url = Uri.https('api.namefake.com', '');

  Future<UserGenerateModel> generateUserName() async {
    var response = await http.get(_url);

    var json = jsonDecode(response.body) as Map<String, dynamic>;

    return UserGenerateModel.fromJson(json);
  }
}
