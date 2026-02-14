abstract class SectionsEvent {}

class LoadSectionsByCourseEvent extends SectionsEvent {
  final int courseId;

  LoadSectionsByCourseEvent({required this.courseId});
}

class LoadLessonsBySectionEvent extends SectionsEvent {
  final int sectionId;

  LoadLessonsBySectionEvent({required this.sectionId});
}
