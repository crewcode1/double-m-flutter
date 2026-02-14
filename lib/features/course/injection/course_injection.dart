import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/course/data/data_source/courses_remote_data_source.dart';
import 'package:doublem/features/course/data/repositories/courses_repository_impl.dart';
import 'package:doublem/features/course/domain/repositories/courses_repository.dart';
import 'package:doublem/features/course/domain/use_cases/enroll_in_course_use_case.dart';
import 'package:doublem/features/course/domain/use_cases/get_all_courses_use_case.dart';
import 'package:doublem/features/course/domain/use_cases/get_course_by_id_use_case.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_bloc.dart';

void initCoursesInjection() {
  // Bloc
  getIt.registerFactory(
    () => CoursesBloc(
      getAllCoursesUseCase: getIt(),
      getCourseByIdUseCase: getIt(),
      enrollInCourseUseCase: getIt(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(() => GetAllCoursesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetCourseByIdUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => EnrollInCourseUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<CoursesRepository>(
    () => CoursesRepositoryImpl(remoteDataSource: getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<CoursesRemoteDataSource>(
    () => CoursesRemoteDataSourceImpl(apiServices: getIt()),
  );
}
