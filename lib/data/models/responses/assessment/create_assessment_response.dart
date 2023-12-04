class CreateAssessmentResponse {
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
  int numberOfAttempts;
  List<dynamic> students;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  CreateAssessmentResponse({
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
    required this.numberOfAttempts,
    required this.students,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CreateAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      CreateAssessmentResponse(
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
        numberOfAttempts: json["numberOfAttempts"],
        students: List<dynamic>.from(json["students"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
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
        "numberOfAttempts": numberOfAttempts,
        "students": List<dynamic>.from(students.map((x) => x)),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
