import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/domain/repositories/sections_lessons_repository.dart';

class GetLessonsBySectionIdUseCase {
  final SectionsAndLessonsRepository repository;

  GetLessonsBySectionIdUseCase({required this.repository});

  Future<Either<Failure, List<LessonEntity>>> call({required int sectionId}) {
    return repository.getLessonsBySectionId(sectionId: sectionId);
  }
}
