import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';

abstract class SectionsAndLessonsRepository {
  Future<Either<Failure, List<SectionEntity>>> getSectionsByCourseId({
    required int courseId,
  });

  Future<Either<Failure, List<LessonEntity>>> getLessonsBySectionId({
    required int sectionId,
  });
}
