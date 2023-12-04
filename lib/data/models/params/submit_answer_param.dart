class StudentSubmitAnswerParam {
  List<Response> responses;

  StudentSubmitAnswerParam({
    required this.responses,
  });

  factory StudentSubmitAnswerParam.fromJson(Map<String, dynamic> json) =>
      StudentSubmitAnswerParam(
        responses: List<Response>.from(
            json["responses"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responses": List<dynamic>.from(responses.map((x) => x.toJson())),
      };
}

class Response {
  String questionId;
  List<SelectionOption> selectionOption;

  Response({
    required this.questionId,
    required this.selectionOption,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        questionId: json["questionId"],
        selectionOption: List<SelectionOption>.from(
            json["selectionOption"].map((x) => SelectionOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "selectionOption":
            List<dynamic>.from(selectionOption.map((x) => x.toJson())),
      };
}

class SelectionOption {
  String choice;

  SelectionOption({
    required this.choice,
  });

  factory SelectionOption.fromJson(Map<String, dynamic> json) =>
      SelectionOption(
        choice: json["choice"],
      );

  Map<String, dynamic> toJson() => {
        "choice": choice,
      };
}
