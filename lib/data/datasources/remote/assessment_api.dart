import 'package:pay_for_material/data/datasources/remote/base/api_service.dart';
import 'package:pay_for_material/data/models/responses/assessment/invite_student_response.dart';
import 'package:pay_for_material/data/models/responses/assessment/student_assessments_model.dart';

import '../../models/models.dart';
import '../../models/responses/assessment/create_assessment_response.dart';
import '../../models/responses/assessment/question_list_response.dart';
import 'base/api_failure.dart';
import 'base/api_response.dart';

class AssessmentApi {
  final _apiService = ApiService(path: '/assessments');

  Future<ApiResponse<List<Assessment>?>> getAssessments(
      {required String status}) async {
    try {
      final res =
          await _apiService.get("/educator", queryParams: {'status': status});

      return ApiResponse.fromJson(res)
        ..data =
            (res['data'] as List).map((e) => Assessment.fromJson(e)).toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<SingleAssessment>> getSingleAssessment(
      {required String assessmentId}) async {
    try {
      final res = await _apiService.get(
        "/$assessmentId",
      );

      return ApiResponse.fromJson(res)
        ..data = SingleAssessment.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<CreateAssessmentResponse>> createAssessment(
      {required CreateAssessmentParam param}) async {
    try {
      final res = await _apiService.post("/", data: param.toJson());

      return ApiResponse.fromJson(res)
        ..data = CreateAssessmentResponse.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> updateAssessment({
    required UpdateAssessmentParam param,
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.patch(
        '/$assessmentId',
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<InviteStudentByEmailResponse>> inviteStudent(
      {required String email, required String assessmentId}) async {
    try {
      final res = await _apiService
          .post("/$assessmentId/students", data: {"email": email});

      return ApiResponse.fromJson(res)
        ..data = InviteStudentByEmailResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String?>> createQuestion({
    required CreateQuestionParam param,
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.post(
        '/$assessmentId/create-question',
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)..data = res['data']['_id'];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<QuestionsResponse>> getQuestion({
    required String questionId,
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.get(
        '/$assessmentId/questions/$questionId',
      );
      return ApiResponse.fromJson(res)
        ..data = (res).map((e) => QuestionsResponse.fromJson(e));
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> deleteQuestion({
    required String questionId,
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.delete(
        '/$assessmentId/delete-question/$questionId',
      );
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> updateQuestion({
    required CreateQuestionParam param,
    required String assessmentId,
    required String questionId,
  }) async {
    try {
      final res = await _apiService.patch(
        '/$assessmentId/update-question/$questionId',
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<QuestionsResponse>?>> getQuestionList({
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.get(
        "/$assessmentId/educator/questions",
      );

      return ApiResponse.fromJson(res)
        ..data = (res['data'] as List)
            .map((e) => QuestionsResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String?>> getSharableId({
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.get(
        '/$assessmentId/share',
      );
      return ApiResponse.fromJson(res)..data = res['data']['sharableId'];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  ////Students API
  Future<ApiResponse<List<StudentAssessments>?>> getStudentAssessments(
      {required String state}) async {
    try {
      final res = await _apiService
          .get("/list", queryParams: {'assessmentState': state});

      return ApiResponse.fromJson(res)
        ..data = (res['data'] as List)
            .map((e) => StudentAssessments.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<SingleAssessment>> getSingleStudentAssessment(
      {required String assessmentId}) async {
    try {
      final res = await _apiService.get(
        "/student/$assessmentId",
      );

      return ApiResponse.fromJson(res)
        ..data = SingleAssessment.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<StudentQuestion>?>> getStudentQuestionList({
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.get(
        "/$assessmentId/student/questions",
      );

      return ApiResponse.fromJson(res)
        ..data = (res['data'] as List)
            .map((e) => StudentQuestion.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  ///Attempts
  // Future<ApiResponse> updateQuestion({
  //   required CreateQuestionParam param,
  //   required String assessmentId,
  //   required String questionId,
  // }) async {
  //   try {
  //     final res = await _apiService.patch(
  //       '/$assessmentId/update-question/$questionId',
  //       data: param.toJson(),
  //     );
  //     return ApiResponse.fromJson(res);
  //   } on ApiFailure catch (e) {
  //     return ApiResponse(success: false, message: e.message);
  //   }
  // }
}
