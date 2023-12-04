import 'package:pay_for_material/data/models/create_question/option_model.dart';

class Question {
  final String questionText;
  final List<Option>? options;
  final String? answerText;

  const Question({required this.questionText, this.options, this.answerText});
}
