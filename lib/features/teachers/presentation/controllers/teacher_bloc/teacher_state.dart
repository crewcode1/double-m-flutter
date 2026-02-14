import 'package:doublem/features/teachers/domain/entities/teacher_details_entity.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';

abstract class TeachersState {}

class TeachersInitial extends TeachersState {}

class TeachersLoading extends TeachersState {}

class TeacherDetailsLoaded extends TeachersState {
  final TeacherDetailsEntity details;

  TeacherDetailsLoaded({required this.details});
}

class TeachersError extends TeachersState {
  final String message;

  TeachersError({required this.message});
}

class LoadingAllTeachersState extends TeachersState {}

class AllTeachersLoadedState extends TeachersState {
  final List<TeacherEntity> teachers;

  AllTeachersLoadedState({required this.teachers});
}

class FailedToLoadTeachersState extends TeachersState {
  final String message;

  FailedToLoadTeachersState({required this.message});
}
