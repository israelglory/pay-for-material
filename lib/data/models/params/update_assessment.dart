class UpdateAssessmentParam {
  String? title;
  String? code;
  String? description;
  String? author;
  DateTime? datetime;
  String? time;
  int? duration;

  UpdateAssessmentParam({
    this.title,
    this.code,
    this.description,
    this.author,
    this.datetime,
    this.time,
    this.duration,
  });

  factory UpdateAssessmentParam.fromJson(Map<String, dynamic> json) =>
      UpdateAssessmentParam(
        title: json["title"],
        code: json["code"],
        description: json["description"],
        author: json["author"],
        datetime: DateTime.parse(json["datetime"]),
        time: json["time"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) data["title"] = title;
    if (code != null) data["code"] = code;
    if (description != null) data["description"] = description;
    if (author != null) data["author"] = author;
    if (datetime != null) data["datetime"] = datetime!.toIso8601String();
    if (time != null) data["time"] = time;
    if (duration != null) data["duration"] = duration;
    return data;
  }
}
