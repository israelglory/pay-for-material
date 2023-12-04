class StudentQuestion {
  String? id;
  String? assessment;
  String? educator;
  String? title;
  String? answerType;
  List<StudentOption>? options;
  int? points;
  DateTime? createdAt;
  DateTime? updatedAt;

  StudentQuestion({
    this.id,
    this.assessment,
    this.educator,
    this.title,
    this.answerType,
    this.options,
    this.points,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentQuestion.fromJson(Map<String, dynamic> json) =>
      StudentQuestion(
        id: json["_id"],
        assessment: json["assessment"],
        educator: json["educator"],
        title: json["title"],
        answerType: json["answerType"],
        options: json["options"] != null
            ? List<StudentOption>.from(
                json["options"].map((x) => StudentOption.fromJson(x)))
            : [],
        points: json["points"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "assessment": assessment,
        "educator": educator,
        "title": title,
        "answerType": answerType,
        "options": options != null
            ? List<dynamic>.from(options!.map((x) => x.toJson()))
            : [],
        "points": points,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class StudentOption {
  String? text;

  StudentOption({
    this.text,
  });

  factory StudentOption.fromJson(Map<String, dynamic> json) => StudentOption(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
