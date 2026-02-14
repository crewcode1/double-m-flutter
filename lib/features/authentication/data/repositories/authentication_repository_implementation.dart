import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/authentication/data/data_source/authentication_remote_data_source.dart';
import 'package:doublem/features/authentication/data/models/authentication_response_model.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/biometrics_login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/change_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/confirm_email_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/forgot_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/register_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/user_profile_model.dart';
import 'package:doublem/features/authentication/domain/entities/authentication_session.dart';
import 'package:doublem/features/authentication/domain/entities/user_profile.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, AuthSession>> biometricLogin({
    required BiometricLoginRequestBody request,
  }) async {
    try {
      final dynamic response = await authRemoteDataSource.biometricLogin(
        request: request,
      );
      final AuthResponseModel responseModel = response as AuthResponseModel;
      final AuthSession authSession = responseModel.toEntity();
      return Either.succeed(authSession);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequestBody request,
  }) async {
    try {
      await authRemoteDataSource.changePassword(request: request);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> confirmEmail({
    required ConfirmEmailRequestBody request,
  }) async {
    try {
      await authRemoteDataSource.confirmEmail(request: request);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({
    required ForgotPasswordRequestBody request,
  }) async {
    try {
      await authRemoteDataSource.forgotPassword(request: request);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthSession>> login({
    required LoginRequestBody request,
  }) async {
    try {
      final dynamic response = await authRemoteDataSource.login(
        request: request,
      );
      final AuthResponseModel responseModel = response as AuthResponseModel;
      final AuthSession authSession = responseModel.toEntity();
      return Either.succeed(authSession);
    } catch (e) {
      print('error${e} ');
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDataSource.logout();
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthSession>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final dynamic response = await authRemoteDataSource.refreshToken(
        refreshToken: refreshToken,
      );
      final AuthResponseModel responseModel = response as AuthResponseModel;
      final AuthSession authSession = responseModel.toEntity();
      return Either.succeed(authSession);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required RegisterRequestBody request,
  }) async {
    try {
      // final dynamic response = await authRemoteDataSource.register(
      //   request: request,
      // );
      await authRemoteDataSource.register(request: request);
      // final AuthResponseModel responseModel = response as AuthResponseModel;
      // final AuthSession authSession = responseModel.toEntity();
      return Either.succeed(null);
    } catch (e) {
      print('error${e} ');

      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordRequestBody request,
  }) async {
    try {
      await authRemoteDataSource.resetPassword(request: request);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserProfile>> loadProfile() async {
    try {
      final dynamic response = await authRemoteDataSource.loadProfile();
      final UserProfileModel userProfileModel = response as UserProfileModel;
      final UserProfile userProfile = userProfileModel.toEntity();
      return Either.succeed(userProfile);
    } catch (e) {
      print('error${e} ');
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }
}
