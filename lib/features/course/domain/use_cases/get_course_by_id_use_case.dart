import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/course/domain/repositories/courses_repository.dart';

class GetCourseByIdUseCase {
  final CoursesRepository repository;

  GetCourseByIdUseCase({required this.repository});

  Future<Either<Failure, CourseEntity>> call({required int courseId}) {
    return repository.getCourseById(courseId: courseId);
  }
}
