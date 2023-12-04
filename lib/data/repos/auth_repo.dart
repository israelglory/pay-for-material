import 'package:pay_for_material/core/cores.dart';
import 'package:pay_for_material/core/states/app_state.dart';
import 'package:pay_for_material/data/datasources/remote/auth_api.dart';
import 'package:pay_for_material/data/datasources/remote/base/api_response.dart';
import 'package:pay_for_material/data/models/params/reset_password_param.dart';

import '../data.dart';

class AuthRepository {
  final _authApi = AuthApi();

  Future<ApiResponse<LoginResponse?>> login(
      {required String email, required String password}) async {
    final res = await _authApi.login(email: email, password: password);
    if (res.success) {
      authLocalStorage.saveToken(res.data?.token);
      appLocalStorage.saveAppState(AppState.authenticated);
      appLocalStorage.saveUser(res.data?.user);
      appGlobals.user = res.data?.user;
      appGlobals.token = res.data?.token;
    }
    return res;
  }

  Future<ApiResponse> register({required RegisterParam param}) {
    return _authApi.register(param: param);
  }

  Future<ApiResponse> verifyEmail(
      {required String email, required String pin}) {
    return _authApi.verifyEmail(email: email, pin: pin);
  }

  Future<ApiResponse> forgetPassword({
    required String email,
  }) {
    return _authApi.forgetPassword(
      email: email,
    );
  }

  Future<ApiResponse> resendVerification({
    required String email,
  }) {
    return _authApi.resendVerification(
      email: email,
    );
  }

  Future<ApiResponse> resetPassword({
    required ResetPasswordParam param,
  }) {
    return _authApi.resetPassword(
      param: param,
    );
  }
}
