import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';

abstract class TeachersRepository {
  Future<Either<Failure, TeacherEntity>> getTeacherById({
    required String teacherId,
  });

  Future<Either<Failure, List<CourseEntity>>> getTeacherCourses({
    required String teacherId,
  });
  Future<Either<Failure, List<TeacherEntity>>> getAllTeachers();
}
