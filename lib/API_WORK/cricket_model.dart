class CricketModel {
  String? format;
  String? playername;
  int? age;
  CricketModel({this.format, this.playername, this.age});

  factory CricketModel.fromJson(Map<String, dynamic> parsedJson) {
    return CricketModel(
      format: parsedJson['format'],
      playername: parsedJson['playername'],
      age: parsedJson['age'],
    );
  }
}
