abstract class CoursesEvent {}

class LoadAllCoursesEvent extends CoursesEvent {}

class LoadCourseDetailsEvent extends CoursesEvent {
  final int courseId;

  LoadCourseDetailsEvent({required this.courseId});
}

class EnrollInCourseRequestEvent extends CoursesEvent {
  final String courseCode;

  EnrollInCourseRequestEvent({required this.courseCode});
}
