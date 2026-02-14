import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';

abstract class CoursesState {}

class CoursesInitial extends CoursesState {}

class CoursesLoading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  final List<EnrolledCourse> courses;

  CoursesLoaded({required this.courses});
}

class CourseDetailsLoaded extends CoursesState {
  final CourseEntity course;

  CourseDetailsLoaded({required this.course});
}

class CoursesError extends CoursesState {
  final String message;

  CoursesError({required this.message});
}

class CourseEnrolled extends CoursesState {}

class CourseEnrollmentError extends CoursesState {
  final String message;

  CourseEnrollmentError({required this.message});
}

class CourseEnrollmentLoading extends CoursesState {}
