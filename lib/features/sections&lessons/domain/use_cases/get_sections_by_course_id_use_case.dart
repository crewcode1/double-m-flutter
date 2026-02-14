import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections&lessons/domain/repositories/sections_lessons_repository.dart';

class GetSectionsByCourseIdUseCase {
  final SectionsAndLessonsRepository repository;

  GetSectionsByCourseIdUseCase({required this.repository});

  Future<Either<Failure, List<SectionEntity>>> call({required int courseId}) {
    return repository.getSectionsByCourseId(courseId: courseId);
  }
}
