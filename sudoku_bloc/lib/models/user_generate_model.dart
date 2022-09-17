class UserGenerateModel {
  final String userName;

  UserGenerateModel({required this.userName});

  factory UserGenerateModel.fromJson(Map<String, dynamic> json) {
    return UserGenerateModel(userName: json['username']);
  }
}
