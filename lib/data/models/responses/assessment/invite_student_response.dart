// To parse this JSON data, do
//
//     final inviteStudentByEmailResponse = inviteStudentByEmailResponseFromJson(jsonString);

class InviteStudentByEmailResponse {
  String message;

  InviteStudentByEmailResponse({
    required this.message,
  });

  factory InviteStudentByEmailResponse.fromJson(Map<String, dynamic> json) =>
      InviteStudentByEmailResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
