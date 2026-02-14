import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/sections&lessons/data/data_source/lessons_remote_data_source.dart';
import 'package:doublem/features/sections&lessons/data/data_source/sections_remote_data_source.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections&lessons/domain/repositories/sections_lessons_repository.dart';

class SectionsAndLessonsRepositoryImpl implements SectionsAndLessonsRepository {
  final SectionsRemoteDataSource sectionsRemoteDataSource;
  final LessonsRemoteDataSource lessonsRemoteDataSource;

  SectionsAndLessonsRepositoryImpl({
    required this.sectionsRemoteDataSource,
    required this.lessonsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<SectionEntity>>> getSectionsByCourseId({
    required int courseId,
  }) async {
    try {
      final models = await sectionsRemoteDataSource.getSectionsByCourseId(
        courseId: courseId,
      );

      return Either.succeed(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<LessonEntity>>> getLessonsBySectionId({
    required int sectionId,
  }) async {
    try {
      final models = await lessonsRemoteDataSource.getLessonsBySectionId(
        sectionId: sectionId,
      );

      return Either.succeed(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }
}
