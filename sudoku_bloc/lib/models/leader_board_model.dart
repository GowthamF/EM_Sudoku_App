import 'package:sudoku_bloc/sudoku_bloc.dart';

class LeaderBoardModel {
  final String duration;
  final String userName;
  final String userId;
  final String country;
  final Levels levels;
  final String playedDateTime;

  LeaderBoardModel(
      {required this.duration,
      required this.userName,
      required this.userId,
      required this.country,
      required this.levels,
      required this.playedDateTime});

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    return LeaderBoardModel(
        duration: json['duration'],
        userName: json['userName'],
        userId: json['userId'],
        country: json['country'],
        levels: Levels.values.firstWhere(
            (element) => element.name == json['level'],
            orElse: () => Levels.easy),
        playedDateTime: json['playedDateTime']);
  }

  Map<String, dynamic> toJson() {
    return {
      "duration": duration,
      "userName": userName,
      "userId": userId,
      "country": country,
      "level": levels.name,
      "playedDateTime": playedDateTime,
    };
  }
}
