import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/biometrics_login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/change_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/register_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:doublem/features/authentication/domain/entities/authentication_session.dart';

abstract class AuthRepository {
  Future<Either<String, AuthSession>> login(LoginRequest request);
  Future<Either<String, AuthSession>> register(RegisterRequest request);
  Future<Either<String, AuthSession>> biometricLogin(
    BiometricLoginRequest request,
  );

  Future<Either<String, void>> forgotPassword(
    ChangePasswordRequestBody request,
  );
  Future<Either<String, void>> resetPassword(ResetPasswordRequestBody request);
  Future<Either<String, void>> changePassword(
    ChangePasswordRequestBody request,
  );
  Future<Either<String, void>> confirmEmail(String userId, String token);
  Future<Either<String, AuthSession>> refreshToken(String refreshToken);
  Future<Either<String, void>> logout();
}
