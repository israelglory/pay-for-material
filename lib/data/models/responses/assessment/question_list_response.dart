import '../../create_question/option_model.dart';

class QuestionsResponse {
  String? id;
  String? assessment;
  String? educator;
  String? title;
  String? answerType;
  int? points;
  String? answerText;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Option>? options;

  QuestionsResponse({
    required this.id,
    required this.assessment,
    required this.educator,
    required this.title,
    required this.answerType,
    required this.points,
    this.answerText,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.options,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      QuestionsResponse(
        id: json["_id"],
        assessment: json["assessment"],
        educator: json["educator"],
        title: json["title"],
        answerType: json["answerType"],
        points: json["points"],
        answerText: json["answerText"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "assessment": assessment,
        "educator": educator,
        "title": title,
        "answerType": answerType,
        "points": points,
        "answerText": answerText,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}
