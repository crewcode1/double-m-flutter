import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/sections&lessons/data/data_source/lessons_remote_data_source.dart';
import 'package:doublem/features/sections&lessons/data/data_source/sections_remote_data_source.dart';
import 'package:doublem/features/sections&lessons/data/repositories/sections_lessons_repository_impl.dart';
import 'package:doublem/features/sections&lessons/domain/repositories/sections_lessons_repository.dart';
import 'package:doublem/features/sections&lessons/domain/use_cases/get_lessons_by_section_id_use_case.dart';
import 'package:doublem/features/sections&lessons/domain/use_cases/get_sections_by_course_id_use_case.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_bloc.dart';

void initSectionsInjection() {
  // Bloc
  getIt.registerFactory(
    () => SectionsAndLessonsBloc(
      getSectionsByCourseIdUseCase: getIt(),
      getLessonsBySectionIdUseCase: getIt(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(
    () => GetSectionsByCourseIdUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetLessonsBySectionIdUseCase(repository: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SectionsAndLessonsRepository>(
    () => SectionsAndLessonsRepositoryImpl(
      sectionsRemoteDataSource: getIt(),
      lessonsRemoteDataSource: getIt(),
    ),
  );

  // Data Sources
  getIt.registerLazySingleton<SectionsRemoteDataSource>(
    () => SectionsRemoteDataSourceImpl(apiServices: getIt()),
  );

  getIt.registerLazySingleton<LessonsRemoteDataSource>(
    () => LessonsRemoteDataSourceImpl(apiServices: getIt()),
  );
}
