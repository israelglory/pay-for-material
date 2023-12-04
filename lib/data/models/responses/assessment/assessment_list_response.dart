// To parse this JSON data, do
//
//     final assessmentListResponse = assessmentListResponseFromJson(jsonString);

class Assessment {
  int? numberOfAttempts;
  String? id;
  String? educator;
  String? title;
  String? code;
  String? description;
  String? author;
  DateTime? datetime;
  int? duration;
  int? passPoint;
  int? failPoint;
  String? type;
  String? status;
  int? numberOfQuestions;
  List<String>? students;
  DateTime? createdAt;
  DateTime? updatedAt;

  Assessment({
    this.numberOfAttempts,
    this.id,
    this.educator,
    this.title,
    this.code,
    this.description,
    this.author,
    this.datetime,
    this.duration,
    this.passPoint,
    this.failPoint,
    this.type,
    this.status,
    this.numberOfQuestions,
    this.students,
    this.createdAt,
    this.updatedAt,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
        numberOfAttempts: json["numberOfAttempts"],
        id: json["_id"],
        educator: json["educator"],
        title: json["title"],
        code: json["code"],
        description: json["description"],
        author: json["author"],
        datetime: DateTime.parse(json["datetime"]),
        duration: json["duration"],
        passPoint: json["passPoint"],
        failPoint: json["failPoint"],
        type: json["type"],
        status: json["status"],
        numberOfQuestions: json["numberOfQuestions"] ?? 0,
        students: json["students"] != null
            ? List<String>.from(json["students"].map((x) => x))
            : [],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "numberOfAttempts": numberOfAttempts,
        "_id": id,
        "educator": educator,
        "title": title,
        "code": code,
        "description": description,
        "author": author,
        "datetime": datetime?.toIso8601String(),
        "duration": duration,
        "passPoint": passPoint,
        "failPoint": failPoint,
        "type": type,
        "status": status,
        "numberOfQuestions": numberOfQuestions,
        "students":
            students != null ? List<dynamic>.from(students!.map((x) => x)) : [],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
