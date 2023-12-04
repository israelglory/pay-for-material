// To parse this JSON data, do
//
//     final studentAssessments = studentAssessmentsFromJson(jsonString);

class StudentAssessments {
  String id;
  String student;
  AssessmentData assessment;
  String assessmentState;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  StudentAssessments({
    required this.id,
    required this.student,
    required this.assessment,
    required this.assessmentState,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory StudentAssessments.fromJson(Map<String, dynamic> json) =>
      StudentAssessments(
        id: json["_id"],
        student: json["student"],
        assessment: AssessmentData.fromJson(json["assessment"]),
        assessmentState: json["assessmentState"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "student": student,
        "assessment": assessment.toJson(),
        "assessmentState": assessmentState,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class AssessmentData {
  String id;
  String educator;
  String title;
  String code;
  String description;
  String author;
  DateTime datetime;
  int duration;
  int passPoint;
  int failPoint;
  String type;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  AssessmentData({
    required this.id,
    required this.educator,
    required this.title,
    required this.code,
    required this.description,
    required this.author,
    required this.datetime,
    required this.duration,
    required this.passPoint,
    required this.failPoint,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssessmentData.fromJson(Map<String, dynamic> json) => AssessmentData(
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "educator": educator,
        "title": title,
        "code": code,
        "description": description,
        "author": author,
        "datetime": datetime.toIso8601String(),
        "duration": duration,
        "passPoint": passPoint,
        "failPoint": failPoint,
        "type": type,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
