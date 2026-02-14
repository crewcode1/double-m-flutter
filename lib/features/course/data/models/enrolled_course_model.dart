import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enrolled_course_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EnrolledCourseModel {
  final int? id;
  final int? courseId;
  final String? courseTitle;
  final String? courseImageUrl;
  final String? teacherName;
  final DateTime? enrolledAt;
  EnrolledCourseModel({
    required this.id,
    required this.courseId,
    required this.courseTitle,
    required this.courseImageUrl,
    required this.teacherName,
    required this.enrolledAt,
  });
  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseModelFromJson(json);

  EnrolledCourse toEntity() => EnrolledCourse(
    id: id ?? 0,
    courseId: courseId ?? 0,
    courseTitle: courseTitle ?? 'Course Title',
    courseImageUrl: courseImageUrl ?? '',
    teacherName: teacherName ?? 'Teacher Name',
    enrolledAt: enrolledAt ?? DateTime.now(),
  );
}
