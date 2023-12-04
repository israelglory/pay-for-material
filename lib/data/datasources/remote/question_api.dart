import 'package:pay_for_material/data/datasources/remote/base/api_failure.dart';
import 'package:pay_for_material/data/datasources/remote/base/api_response.dart';
import 'package:pay_for_material/data/models/responses/assessment/question_list_response.dart';

import '../../data.dart';
import '../../models/params/submit_answer_param.dart';
import 'base/api_service.dart';

class QuestionApi {
  final _apiService = ApiService(path: '/assessments');

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

  ////Students API

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

  Future<ApiResponse<String?>> submitAnswer({
    required StudentSubmitAnswerParam param,
    required String assessmentId,
  }) async {
    try {
      final res = await _apiService.post(
        '/$assessmentId/submit',
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res);
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
