import 'package:doublem/core/env/env.dart';
import 'package:doublem/core/localization/cubit/localization_cubit.dart';
import 'package:doublem/core/routes/app_router.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/services/implementation/api_services_implementation.dart';
import 'package:doublem/core/theme/cubit/theming_cubit.dart';
import 'package:doublem/features/login/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:doublem/features/login/presentation/controllers/remember_me_cubit/remember_me_cubit.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initGetIt() {
  // Routing
  AppRouter.createRouter();

  // Dio Services
  getIt.registerLazySingleton<ApiServices>(
    () => DioApiServices(baseUrl: Env.baseUrl),
  );

  getIt.registerSingleton((ThemingCubit()));
  getIt.registerSingleton((LocalizationCubit()));
  getIt.registerFactory(() => ShowPasswordCubit());
  getIt.registerLazySingleton(() => RememberMeCubit());
  getIt.registerFactory(() => SignupVerificationBloc());
}
