import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/authentication/data/models/authentication_response_model.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/biometrics_login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/change_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/confirm_email_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/forgot_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/register_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/user_profile_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({required LoginRequestBody request});
  Future<void> register({required RegisterRequestBody request});
  Future<AuthResponseModel> biometricLogin({
    required BiometricLoginRequestBody request,
  });

  Future<void> forgotPassword({required ForgotPasswordRequestBody request});
  Future<void> resetPassword({required ResetPasswordRequestBody request});
  Future<void> changePassword({required ChangePasswordRequestBody request});
  Future<void> confirmEmail({required ConfirmEmailRequestBody request});
  Future<AuthResponseModel> refreshToken({required String refreshToken});
  Future<UserProfileModel> loadProfile();
  Future<String> generateParentCode();
  // Future<void> updateProfile({required UpdateProileRequestBody request});
  Future<void> logout();

  AuthResponseModel parsingLoginResponse(Response response) {
    if (response.data['data'] != null) {
      return AuthResponseModel.fromJson(response.data['data']);
    } else {
      throw Exception('Invalid response format: missing "data" field');
    }
  }

  String parsingParentCode(Response response) {
    Map<String, dynamic> data = response.data['data'];
    String code = data["code"];
    return code;
  }

  AuthResponseModel parsingBiometricsLoginResponse(Response response) {
    return AuthResponseModel.fromJson(response.data);
  }

  UserProfileModel parsingProfile(Response response) {
    return UserProfileModel.fromJson(response.data['data']);
  }
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponseModel> biometricLogin({
    required BiometricLoginRequestBody request,
  }) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.login,
      data: request.toJson(),
    );
    return parsingBiometricsLoginResponse(response);
  }

  @override
  Future<void> changePassword({
    required ChangePasswordRequestBody request,
  }) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.changePassword,
      data: request.toJson(),
    );
    response.data;
  }

  @override
  Future<void> confirmEmail({required ConfirmEmailRequestBody request}) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.login,
      data: request.toJson(),
    );
    return response.data;
  }

  @override
  Future<void> forgotPassword({
    required ForgotPasswordRequestBody request,
  }) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.forgotPassword,
      data: request.toJson(),
    );
    return response.data;
  }

  @override
  Future<AuthResponseModel> login({required LoginRequestBody request}) async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    Response response = await apiServices.post(
      endPoint: EndPoints.login,
      data: request.toJson(),
      deviceToken: deviceToken,
    );
    return parsingLoginResponse(response);
  }

  @override
  Future<void> logout() async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    Response response = await apiServices.post(
      endPoint: EndPoints.logout,
      token: userToken,
      deviceToken: deviceToken,
    );
    return response.data;
  }

  @override
  Future<AuthResponseModel> refreshToken({required String refreshToken}) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.logout,
      query: {'refreshToken': refreshToken},
    );
    return response.data;
  }

  @override
  Future<void> register({required RegisterRequestBody request}) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.register,
      data: request.toJson(),
    );
    return response.data;
  }

  @override
  Future<void> resetPassword({
    required ResetPasswordRequestBody request,
  }) async {
    Response response = await apiServices.post(
      endPoint: EndPoints.resetPassword,
      data: request.toJson(),
    );
    return response.data;
  }

  @override
  Future<UserProfileModel> loadProfile() async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    String? userToken = CacheUtils().getString(key: 'userToken');
    Response response = await apiServices.get(
      endPoint: EndPoints.userProfile,
      token: userToken,
      deviceToken: deviceToken,
    );
    return parsingProfile(response);
  }

  @override
  Future<String> generateParentCode() async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    Response response = await apiServices.post(
      endPoint: '${EndPoints.parent}/${EndPoints.generateParentCode}',
      token: userToken,
      deviceToken: deviceToken,
    );
    return parsingParentCode(response);
    // return parsingProfile(response);
  }

  // @override
  // Future<void> updateProfile({required UpdateProileRequestBody request}) async {
  //   Response response = await apiServices.put(
  //     endPoint: EndPoints.userProfile,
  //     data: request.toJson(),
  //     token: CacheUtils().getString(key: 'token'),
  //   );
  //   return response.data;
  // }
}
