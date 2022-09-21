class NumbersGenerateModel {
  final int squareLocationIndex;
  final int sqareLocationValue;
  final bool isVisibleToUser;

  NumbersGenerateModel({
    required this.squareLocationIndex,
    required this.sqareLocationValue,
    required this.isVisibleToUser,
  });

  factory NumbersGenerateModel.fromJson(Map<String, dynamic> json) {
    return NumbersGenerateModel(
      squareLocationIndex: json['squareLocationIndex'],
      sqareLocationValue: json['sqareLocationValue'],
      isVisibleToUser: json['isVisibleToUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'squareLocationIndex': squareLocationIndex,
      'sqareLocationValue': sqareLocationValue,
      'isVisibleToUser': isVisibleToUser,
    };
  }
}
