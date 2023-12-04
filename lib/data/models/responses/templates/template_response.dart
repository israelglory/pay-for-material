// To parse this JSON data, do
//
//     final Template = TemplateFromJson(jsonString);

class Template {
  String? educator;
  String? title;
  String? code;
  String? description;
  String? author;
  String? type;
  String? imageUrl;
  bool? isPublic;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Template({
    this.educator,
    this.title,
    this.code,
    this.description,
    this.author,
    this.type,
    this.imageUrl,
    this.isPublic,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        educator: json["educator"],
        title: json["title"],
        code: json["code"],
        description: json["description"],
        author: json["author"],
        type: json["type"],
        imageUrl: json["imageUrl"],
        isPublic: json["isPublic"],
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
        "type": type,
        "imageUrl": imageUrl,
        "isPublic": isPublic,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
