abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequest request);
  Future<AuthResponseModel> register(RegisterRequest request);
  Future<AuthResponseModel> biometricLogin(BiometricLoginRequest request);

  Future<void> forgotPassword(ForgotPasswordRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);
  Future<void> changePassword(ChangePasswordRequest request);
  Future<void> confirmEmail(String userId, String token);
  Future<AuthResponseModel> refreshToken(String refreshToken);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthResponseModel> login(LoginRequest request) async {
    final res = await dio.post('/login', data: request.toJson());
    return AuthResponseModel.fromJson(res.data);
  }

  @override
  Future<AuthResponseModel> register(RegisterRequest request) async {
    final res = await dio.post('/register', data: request.toJson());
    return AuthResponseModel.fromJson(res.data);
  }

  @override
  Future<AuthResponseModel> biometricLogin(
    BiometricLoginRequest request,
  ) async {
    final res = await dio.post('/biometric-login', data: request.toJson());
    return AuthResponseModel.fromJson(res.data);
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    await dio.post('/forgot-password', data: request.toJson());
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    await dio.post('/reset-password', data: request.toJson());
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    await dio.post('/change-password', data: request.toJson());
  }

  @override
  Future<void> confirmEmail(String userId, String token) async {
    await dio.post('/confirm-email', data: {'userId': userId, 'token': token});
  }

  @override
  Future<AuthResponseModel> refreshToken(String refreshToken) async {
    final res = await dio.post(
      '/refresh-token',
      data: {'refreshToken': refreshToken},
    );
    return AuthResponseModel.fromJson(res.data);
  }

  @override
  Future<void> logout() async {
    await dio.post('/logout');
  }
}
