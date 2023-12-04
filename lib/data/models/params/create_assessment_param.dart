// To parse this JSON data, do
//
//     final createAssessmentParam = createAssessmentParamFromJson(jsonString);
class CreateAssessmentParam {
  String title;
  String code;
  String description;
  String author;
  DateTime datetime;
  String time;
  int duration;
  int passPoint;
  int failPoint;
  int excellentPoint;
  String type;
  String status;

  CreateAssessmentParam({
    required this.title,
    required this.code,
    required this.description,
    required this.author,
    required this.datetime,
    required this.time,
    required this.duration,
    required this.passPoint,
    required this.failPoint,
    required this.excellentPoint,
    required this.type,
    required this.status,
  });

  factory CreateAssessmentParam.fromJson(Map<String, dynamic> json) =>
      CreateAssessmentParam(
          title: json["title"],
          code: json["code"],
          description: json["description"],
          author: json["author"],
          datetime: DateTime.parse(json["datetime"]),
          time: json["time"],
          duration: json["duration"],
          passPoint: json["passPoint"],
          failPoint: json["failPoint"],
          excellentPoint: json["excellentPoint"],
          type: json["type"],
          status: json["status"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "description": description,
        "author": author,
        "datetime": datetime.toIso8601String(),
        "time": time,
        "duration": duration,
        "passPoint": passPoint,
        "failPoint": failPoint,
        "excellentPoint": excellentPoint,
        "type": type,
        "status": status,
      };
}
