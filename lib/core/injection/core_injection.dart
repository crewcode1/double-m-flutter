import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/localization/cubit/localization_cubit.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/services/implementation/api_services_implementation.dart';
import 'package:doublem/core/services/implementation/remote_config_services.dart';
import 'package:doublem/core/theme/cubit/theming_cubit.dart';
import 'package:doublem/features/authentication/domain/use_cases/resend_verification_otp_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/verify_email_use_case.dart';
import 'package:doublem/features/authentication/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:doublem/features/authentication/presentation/controllers/remember_me_cubit/remember_me_cubit.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';

void initCoreInjection() {
  // Dio Services
  getIt.registerLazySingleton<ApiServices>(
    () => DioApiServices(baseURL: RemoteConfigService().dynamicBaseUrl),
  );

  getIt.registerSingleton((ThemingCubit()));
  getIt.registerSingleton((LocalizationCubit()));
  getIt.registerFactory(() => ShowPasswordCubit());
  getIt.registerLazySingleton(() => RememberMeCubit());
  getIt.registerFactory(
    () => SignupVerificationBloc(
      verifyEmailUseCase: getIt<VerifyEmailUseCase>(),
      resendVerificationOtpUseCase: getIt<ResendVerificationOtpUseCase>(),
    ),
  );
}
