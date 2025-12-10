class StudentInfo {
  StudentInfo({required this.name, required this.score, required this.isMan});

  final String name;
  final int score;
  final bool isMan;

  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo(
      name: json["name"],
      score: json["score"],
      isMan: json["isMan"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "score": score, "isMan": isMan};
  }
}
