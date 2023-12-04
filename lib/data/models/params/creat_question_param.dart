import 'package:pay_for_material/data/data.dart';

class CreateQuestionParam {
  String? id;
  String title;
  String answerType;
  int? points;
  String? answerText;
  List<Option>? options;
  bool? saving;

  CreateQuestionParam({
    this.id,
    required this.title,
    required this.answerType,
    this.points,
    this.answerText,
    this.options,
    this.saving,
  });

  CreateQuestionParam copyWith({
    String? title,
    String? id,
    String? answerType,
    int? points,
    String? answerText,
    List<Option>? options,
    bool? saving,
  }) =>
      CreateQuestionParam(
        title: title ?? this.title,
        id: id ?? this.id,
        answerType: answerType ?? this.answerType,
        points: points ?? this.points,
        answerText: answerText ?? this.answerText,
        options: options ?? this.options,
        saving: saving ?? this.saving,
      );

  factory CreateQuestionParam.fromJson(Map<String, dynamic> json) =>
      CreateQuestionParam(
        title: json["title"],
        answerType: json["answerType"],
        points: json["points"],
        answerText: json["answerText"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "answerType": answerType,
        "points": points,
        if (answerText != null) "answerText": answerText,
        if (options != null)
          "options": List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}
