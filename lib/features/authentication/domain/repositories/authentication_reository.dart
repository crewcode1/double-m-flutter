import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/biometrics_login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/change_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/confirm_email_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/forgot_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/register_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:doublem/features/authentication/domain/entities/authentication_session.dart';
import 'package:doublem/features/authentication/domain/entities/user_profile.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login({
    required LoginRequestBody request,
  });
  Future<Either<Failure, void>> register({
    required RegisterRequestBody request,
  });
  Future<Either<Failure, AuthSession>> biometricLogin({
    required BiometricLoginRequestBody request,
  });

  Future<Either<Failure, void>> forgotPassword({
    required ForgotPasswordRequestBody request,
  });
  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordRequestBody request,
  });
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequestBody request,
  });
  Future<Either<Failure, void>> confirmEmail({
    required ConfirmEmailRequestBody request,
  });
  Future<Either<Failure, AuthSession>> refreshToken({
    required String refreshToken,
  });
  Future<Either<Failure, UserProfile>> loadProfile();
  Future<Either<Failure, String>> generateParentCode();
  Future<Either<Failure, void>> logout();
}
