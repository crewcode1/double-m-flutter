import 'package:equatable/equatable.dart';

class EnrolledCourse extends Equatable {
  final int id;

  final int courseId;
  final String courseTitle;
  final String courseImageUrl;
  final String teacherName;
  final DateTime enrolledAt;
  const EnrolledCourse({
    required this.id,
    required this.courseId,
    required this.courseTitle,
    required this.courseImageUrl,
    required this.teacherName,
    required this.enrolledAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
