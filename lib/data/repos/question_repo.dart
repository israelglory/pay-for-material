import 'package:pay_for_material/data/models/params/submit_answer_param.dart';

import '../data.dart';
import '../datasources/remote/base/api_response.dart';
import '../datasources/remote/question_api.dart';
import '../models/responses/assessment/question_list_response.dart';

class QuestionRepository {
  final _api = QuestionApi();

  Future<ApiResponse<String?>> createQuestion(
      {required CreateQuestionParam param,
      required String assessmentId}) async {
    return _api.createQuestion(param: param, assessmentId: assessmentId);
  }

  Future<ApiResponse<QuestionsResponse>> getQuestion(
      {required String questionId, required String assessmentId}) async {
    return _api.getQuestion(questionId: questionId, assessmentId: assessmentId);
  }

  Future<ApiResponse<List<QuestionsResponse>?>> getQuestionList(
      {required String assessmentId}) async {
    return _api.getQuestionList(assessmentId: assessmentId);
  }

  Future<ApiResponse> deleteQuestion(
      {required String questionId, required String assessmentId}) async {
    return _api.deleteQuestion(
        questionId: questionId, assessmentId: assessmentId);
  }

  Future<ApiResponse> updateQuestion({
    required CreateQuestionParam param,
    required String assessmentId,
    required String questionId,
  }) async {
    return _api.updateQuestion(
        param: param, assessmentId: assessmentId, questionId: questionId);
  }

  ////Students REPO
  Future<ApiResponse<List<StudentQuestion>?>> getStudentQuestionList({
    required String assessmentId,
  }) async {
    return _api.getStudentQuestionList(assessmentId: assessmentId);
  }

  Future<ApiResponse<String?>> submitAnswer({
    required StudentSubmitAnswerParam param,
    required String assessmentId,
  }) async {
    return _api.submitAnswer(param: param, assessmentId: assessmentId);
  }
}
