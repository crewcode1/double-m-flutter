import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/repositories/courses_repository.dart';

class EnrollInCourseUseCase {
  final CoursesRepository repository;
  EnrollInCourseUseCase({required this.repository});

  Future<Either<Failure, void>> call({required String courseCode}) async {
    return await repository.enrollInCourse(courseCode: courseCode);
  }
}
