import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';

class TeacherDetailsEntity {
  final TeacherEntity teacher;
  final List<CourseEntity> courses;

  TeacherDetailsEntity({required this.teacher, required this.courses});
}
