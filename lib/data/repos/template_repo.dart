import 'package:pay_for_material/data/datasources/remote/template_api.dart';
import 'package:pay_for_material/data/models/params/create_template_param.dart';
import 'package:pay_for_material/data/models/responses/responses.dart';

import '../datasources/remote/base/api_response.dart';

class TemplateRepository {
  final _api = TemplateApi();

  Future<ApiResponse<List<Template>?>> getTemplateList() {
    return _api.getTemplateList();
  }

  Future<ApiResponse<Template?>> getTemplate(
      {required String templateId}) async {
    return _api.getTemplate(templateId: templateId);
  }

  Future<ApiResponse> deleteTemplate({required String templateId}) async {
    return _api.deleteTemplate(templateId: templateId);
  }

  Future<ApiResponse> updateTemplate({
    required CreateTemplateParam param,
    required String templateId,
  }) async {
    return _api.updateTemplate(param: param, templateId: templateId);
  }

  Future<ApiResponse> createTemplate(
      {required CreateTemplateParam param}) async {
    return _api.createTemplate(param: param);
  }
}
