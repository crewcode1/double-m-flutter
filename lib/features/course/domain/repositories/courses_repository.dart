import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';

abstract class CoursesRepository {
  Future<Either<Failure, List<EnrolledCourse>>> getAllCourses();
  Future<Either<Failure, CourseEntity>> getCourseById({required int courseId});
  Future<Either<Failure, void>> enrollInCourse({required String courseCode});
}
