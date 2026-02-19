import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:doublem/features/course/domain/repositories/courses_repository.dart';

class GetAllCoursesUseCase {
  final CoursesRepository repository;

  GetAllCoursesUseCase({required this.repository});

  Future<Either<Failure, List<EnrolledCourse>>> call() {
    return repository.getAllCourses();
  }
}
