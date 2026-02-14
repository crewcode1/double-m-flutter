import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/teachers/data/data_source/teachers_remote_data_source.dart';
import 'package:doublem/features/teachers/data/repositories/teachers_repository_impl.dart';
import 'package:doublem/features/teachers/domain/repositories/teachers_repository.dart';
import 'package:doublem/features/teachers/domain/use_cases/get_all_teachers_use_case.dart';
import 'package:doublem/features/teachers/domain/use_cases/get_teacher_details_use_case.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_bloc.dart';

void initTeachersInjection() {
  // Bloc
  getIt.registerFactory(
    () => TeachersBloc(
      getTeacherDetailsUseCase: getIt(),
      getAllTeachersUseCase: getIt(),
    ),
  );

  // UseCase
  getIt.registerLazySingleton(
    () => GetTeacherDetailsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton(() => GetAllTeachersUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<TeachersRepository>(
    () => TeachersRepositoryImpl(remoteDataSource: getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<TeachersRemoteDataSource>(
    () => TeachersRemoteDataSourceImpl(apiServices: getIt()),
  );
}
