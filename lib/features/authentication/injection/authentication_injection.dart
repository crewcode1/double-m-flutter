import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/features/authentication/data/data_source/authentication_remote_data_source.dart';
import 'package:doublem/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';
import 'package:doublem/features/authentication/domain/use_cases/change_password_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/confirm_email_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/forgot_password_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/generating_parent_code_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/load_profile_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/logout_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/reset_password_use_case.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_bloc.dart';

void initAuthenticationInjection() {
  // Data Sources
  // Remote
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiServices: getIt<ApiServices>()),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LoadProfileUseCase>(
    () => LoadProfileUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<ConfirmEmailUseCase>(
    () => ConfirmEmailUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GeneratingParentCodeUseCase>(
    () => GeneratingParentCodeUseCase(authRepository: getIt<AuthRepository>()),
  );

  // Blocs

  getIt.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
      changePasswordUseCase: getIt<ChangePasswordUseCase>(),
      confirmEmailUseCase: getIt<ConfirmEmailUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      loadProfileUseCase: getIt<LoadProfileUseCase>(),
      generatingParentCodeUseCase: getIt<GeneratingParentCodeUseCase>(),
    ),
  );
}
