import 'package:doublem/core/env/env.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/localization/cubit/localization_cubit.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/services/implementation/api_services_implementation.dart';
import 'package:doublem/core/theme/cubit/theming_cubit.dart';
import 'package:doublem/features/authentication/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:doublem/features/authentication/presentation/controllers/remember_me_cubit/remember_me_cubit.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';

void initCoreInjection() {
  // Dio Services
  getIt.registerLazySingleton<ApiServices>(
    () => DioApiServices(baseURL: Env.baseUrl),
  );

  getIt.registerSingleton((ThemingCubit()));
  getIt.registerSingleton((LocalizationCubit()));
  getIt.registerFactory(() => ShowPasswordCubit());
  getIt.registerLazySingleton(() => RememberMeCubit());
  getIt.registerFactory(() => SignupVerificationBloc());
}
