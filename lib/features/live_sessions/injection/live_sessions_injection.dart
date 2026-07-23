import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/live_sessions/data/data_source/live_sessions_remote_data_source.dart';
import 'package:doublem/features/live_sessions/data/repositories/live_sessions_repository_impl.dart';
import 'package:doublem/features/live_sessions/domain/repositories/live_sessions_repository.dart';
import 'package:doublem/features/live_sessions/domain/use_cases/get_all_live_sessions_use_case.dart';
import 'package:doublem/features/live_sessions/domain/use_cases/join_live_session_use_case.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_bloc.dart';

void initLiveSessionsInjection() {
  getIt.registerFactory(
    () => LiveSessionsBloc(
      getAllLiveSessionsUseCase: getIt(),
      joinLiveSessionUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetAllLiveSessionsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton(
    () => JoinLiveSessionUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<LiveSessionsRepository>(
    () => LiveSessionsRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<LiveSessionsRemoteDataSource>(
    () => LiveSessionsRemoteDataSourceImpl(apiServices: getIt()),
  );
}
