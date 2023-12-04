import 'package:pay_for_material/data/datasources/remote/base/api_failure.dart';
import 'package:pay_for_material/data/datasources/remote/base/api_service.dart';
import 'package:pay_for_material/data/models/params/create_template_param.dart';

import '../../models/responses/responses.dart';
import 'base/api_response.dart';

class TemplateApi {
  final _apiService = ApiService(path: '/templates');

  Future<ApiResponse<Template?>> getTemplate(
      {required String templateId}) async {
    try {
      final res = await _apiService.get(
        "/$templateId",
      );

      return ApiResponse.fromJson(res)..data = Template.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<Template>?>> getTemplateList() async {
    try {
      final res = await _apiService.get(
        "/",
      );
      return ApiResponse.fromJson(res)
        ..data =
            (res['data'] as List).map((e) => Template.fromJson(e)).toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> createTemplate(
      {required CreateTemplateParam param}) async {
    try {
      final res = await _apiService.post("/", data: param.toJson());

      return ApiResponse.fromJson(res)..data = Template.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> deleteTemplate({
    required String templateId,
  }) async {
    try {
      final res = await _apiService.delete(
        '/$templateId',
      );
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> updateTemplate({
    required CreateTemplateParam param,
    required String templateId,
  }) async {
    try {
      final res = await _apiService.patch(
        '/$templateId',
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
