class NumbersTrackModel {
  final int listIndex;
  final int index;
  final int value;

  NumbersTrackModel(
      {required this.listIndex, required this.index, required this.value});

  factory NumbersTrackModel.fromJson(Map<String, dynamic> json) {
    return NumbersTrackModel(
      listIndex: json['listIndex'],
      index: json['index'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listIndex': listIndex,
      'index': index,
      'value': value,
    };
  }
}
