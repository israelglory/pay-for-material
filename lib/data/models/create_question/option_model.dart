class Option {
  String text;
  bool isCorrect;

  Option({
    required this.text,
    required this.isCorrect,
  });

  Option copyWith({
    String? text,
    bool? isCorrect,
  }) =>
      Option(
        text: text ?? this.text,
        isCorrect: isCorrect ?? this.isCorrect,
      );

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        isCorrect: json["isCorrect"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "isCorrect": isCorrect,
      };
}
