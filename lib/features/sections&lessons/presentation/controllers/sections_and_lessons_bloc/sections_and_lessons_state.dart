import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';

abstract class SectionsState {}

class SectionsInitial extends SectionsState {}

class SectionsLoading extends SectionsState {}

class SectionsLoaded extends SectionsState {
  final List<SectionEntity> sections;

  SectionsLoaded({required this.sections});
}

class LessonsLoaded extends SectionsState {
  final List<LessonEntity> lessons;

  LessonsLoaded({required this.lessons});
}

class SectionsError extends SectionsState {
  final String message;

  SectionsError({required this.message});
}
