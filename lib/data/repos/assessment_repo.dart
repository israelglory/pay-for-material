import 'package:pay_for_material/data/datasources/remote/assessment_api.dart';
import 'package:pay_for_material/data/datasources/remote/base/api_response.dart';
import 'package:pay_for_material/data/models/responses/assessment/create_assessment_response.dart';
import 'package:pay_for_material/data/models/responses/assessment/question_list_response.dart';

import '../models/params/params.dart';
import '../models/responses/assessment/invite_student_response.dart';
import '../models/responses/assessment/student_assessments_model.dart';
import '../models/responses/responses.dart';

class AssessmentRepository {
  final _api = AssessmentApi();

  Future<ApiResponse<List<Assessment>?>> getAssessment(
      {required String status}) {
    return _api.getAssessments(status: status);
  }

  Future<ApiResponse<SingleAssessment>> getSingleAssessment(
      {required String assessmentId}) async {
    return _api.getSingleAssessment(assessmentId: assessmentId);
  }

  Future<ApiResponse<CreateAssessmentResponse>> createAssessment(
      {required CreateAssessmentParam param}) {
    return _api.createAssessment(param: param);
  }

  Future<ApiResponse> updateAssessment({
    required UpdateAssessmentParam param,
    required String assessmentId,
  }) async {
    return _api.updateAssessment(param: param, assessmentId: assessmentId);
  }

  Future<ApiResponse<InviteStudentByEmailResponse>> inviteStudent(
      {required String email, required String assessmentId}) async {
    return _api.inviteStudent(email: email, assessmentId: assessmentId);
  }

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

  Future<ApiResponse<String?>> getSharableId({
    required String assessmentId,
  }) async {
    return _api.getSharableId(assessmentId: assessmentId);
  }

  ////Students REPO
  Future<ApiResponse<List<StudentAssessments>?>> getStudentAssessments(
      {required String state}) {
    return _api.getStudentAssessments(state: state);
  }

  Future<ApiResponse<SingleAssessment>> getSingleStudentAssessment(
      {required String assessmentId}) async {
    return _api.getSingleStudentAssessment(assessmentId: assessmentId);
  }

  Future<ApiResponse<List<StudentQuestion>?>> getStudentQuestionList({
    required String assessmentId,
  }) async {
    return _api.getStudentQuestionList(assessmentId: assessmentId);
  }
}
