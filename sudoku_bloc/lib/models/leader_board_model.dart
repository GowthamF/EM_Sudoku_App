class LeaderBoardModel {
  final String duration;
  final String userName;
  final String userId;
  final String country;

  LeaderBoardModel(
      {required this.duration,
      required this.userName,
      required this.userId,
      required this.country});

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    return LeaderBoardModel(
      duration: json['duration'],
      userName: json['userName'],
      userId: json['userId'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "duration": duration,
      "userName": userName,
      "userId": userId,
      "country": country
    };
  }
}
