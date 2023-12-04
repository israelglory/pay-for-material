// To parse this JSON data, do
//
//     final singleAssessment = singleAssessmentFromJson(jsonString);

// class SingleAssessment {
//   String? id;
//   String? educator;
//   String? title;
//   String? code;
//   String? description;
//   String? author;
//   DateTime? datetime;
//   String? duration;
//   int? passPoint;
//   int? failPoint;
//   String? type;
//   String? status;
//   int? numberOfQuestions;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? numberOfAttempts;
//   List<AssessmentStudent>? students;

//   SingleAssessment({
//     this.id,
//     this.educator,
//     this.title,
//     this.code,
//     this.description,
//     this.author,
//     this.datetime,
//     this.duration,
//     this.passPoint,
//     this.failPoint,
//     this.type,
//     this.status,
//     this.numberOfQuestions,
//     this.createdAt,
//     this.updatedAt,
//     this.numberOfAttempts,
//     this.students,
//   });

//   factory SingleAssessment.fromJson(Map<String, dynamic> json) =>
//       SingleAssessment(
//         id: json["_id"],
//         educator: json["educator"],
//         title: json["title"],
//         code: json["code"],
//         description: json["description"],
//         author: json["author"],
//         datetime: DateTime.parse(json["datetime"]),
//         duration: json["duration"],
//         passPoint: json["passPoint"],
//         failPoint: json["failPoint"],
//         type: json["type"],
//         status: json["status"],
//         numberOfQuestions: json["numberOfQuestions"] ?? 0,
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         numberOfAttempts: json["numberOfAttempts"],
//         students: json["students"] != null
//             ? List<AssessmentStudent>.from(
//                 json["students"].map((x) => AssessmentStudent.fromJson(x)))
//             : [],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "educator": educator,
//         "title": title,
//         "code": code,
//         "description": description,
//         "author": author,
//         "datetime": datetime!.toIso8601String(),
//         "duration": duration,
//         "passPoint": passPoint,
//         "failPoint": failPoint,
//         "type": type,
//         "status": status,
//         "numberOfQuestions": numberOfQuestions ?? 0,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "numberOfAttempts": numberOfAttempts,
//         "students": students != null
//             ? List<dynamic>.from(students!.map((x) => x.toJson()))
//             : [],
//       };
// }

// class AssessmentStudent {
//   String id;
//   StudentUser user;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   AssessmentStudent({
//      this.id,
//      this.user,
//      this.createdAt,
//      this.updatedAt,
//      this.v,
//   });

//   factory AssessmentStudent.fromJson(Map<String, dynamic> json) =>
//       AssessmentStudent(
//         id: json["_id"],
//         user: StudentUser.fromJson(json["user"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "user": user.toJson(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }

// class StudentUser {
//   String id;
//   String email;

//   StudentUser({
//      this.id,
//      this.email,
//   });

//   factory StudentUser.fromJson(Map<String, dynamic> json) => StudentUser(
//         id: json["_id"],
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "email": email,
//       };
// }

class SingleAssessment {
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
  List<AssessmentStudent>? students;
  DateTime? createdAt;
  DateTime? updatedAt;

  SingleAssessment({
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

  factory SingleAssessment.fromJson(Map<String, dynamic> json) =>
      SingleAssessment(
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
            ? List<AssessmentStudent>.from(
                json["students"].map((x) => AssessmentStudent.fromJson(x)))
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
        "students": students != null
            ? List<dynamic>.from(students!.map((x) => x.toJson()))
            : [],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AssessmentStudent {
  String? id;
  StudentUser? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AssessmentStudent({
    this.id,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AssessmentStudent.fromJson(Map<String, dynamic> json) =>
      AssessmentStudent(
        id: json["_id"],
        user: StudentUser.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class StudentUser {
  String? id;
  String? email;

  StudentUser({
    this.id,
    this.email,
  });

  factory StudentUser.fromJson(Map<String, dynamic> json) => StudentUser(
        id: json["_id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
      };
}
