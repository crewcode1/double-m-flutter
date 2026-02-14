abstract class TeachersEvent {}

class LoadTeacherDetailsEvent extends TeachersEvent {
  final String teacherId;

  LoadTeacherDetailsEvent({required this.teacherId});
}

class LoadAllTeachersEvent extends TeachersEvent {}
