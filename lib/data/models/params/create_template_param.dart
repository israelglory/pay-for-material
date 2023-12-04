// To parse this JSON data, do
//
//     final createTemplateParam = createTemplateParamFromJson(jsonString);

class CreateTemplateParam {
  String? title;
  String? description;
  String? code;
  String? author;
  String? type;
  String? imageUrl;

  CreateTemplateParam({
    this.title,
    this.description,
    this.code,
    this.author,
    this.type,
    this.imageUrl,
  });

  factory CreateTemplateParam.fromJson(Map<String, dynamic> json) =>
      CreateTemplateParam(
        title: json["title"],
        description: json["description"],
        code: json["code"],
        author: json["author"],
        type: json["type"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) data["title"] = title;
    if (description != null) data["description"] = description;
    if (code != null) data["code"] = code;
    if (author != null) data["author"] = author;
    if (type != null) data["type"] = type;
    if (imageUrl != null) data["imageUrl"] = imageUrl;
    return data;
  }
}
