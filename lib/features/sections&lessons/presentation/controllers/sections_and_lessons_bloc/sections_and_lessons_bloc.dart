import 'package:doublem/features/sections&lessons/domain/use_cases/get_lessons_by_section_id_use_case.dart';
import 'package:doublem/features/sections&lessons/domain/use_cases/get_sections_by_course_id_use_case.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_event.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionsAndLessonsBloc extends Bloc<SectionsEvent, SectionsState> {
  final GetSectionsByCourseIdUseCase getSectionsByCourseIdUseCase;
  final GetLessonsBySectionIdUseCase getLessonsBySectionIdUseCase;

  SectionsAndLessonsBloc({
    required this.getSectionsByCourseIdUseCase,
    required this.getLessonsBySectionIdUseCase,
  }) : super(SectionsInitial()) {
    on<LoadSectionsByCourseEvent>(_onLoadSections);
    on<LoadLessonsBySectionEvent>(_onLoadLessons);
  }

  Future<void> _onLoadSections(
    LoadSectionsByCourseEvent event,
    Emitter<SectionsState> emit,
  ) async {
    emit(SectionsLoading());

    final result = await getSectionsByCourseIdUseCase(courseId: event.courseId);

    result.fold(
      (failure) => emit(SectionsError(message: failure.errorMessage)),
      (sections) => emit(SectionsLoaded(sections: sections)),
    );
  }

  Future<void> _onLoadLessons(
    LoadLessonsBySectionEvent event,
    Emitter<SectionsState> emit,
  ) async {
    emit(SectionsLoading());

    final result = await getLessonsBySectionIdUseCase(
      sectionId: event.sectionId,
    );

    result.fold(
      (failure) => emit(SectionsError(message: failure.errorMessage)),
      (lessons) => emit(LessonsLoaded(lessons: lessons)),
    );
  }
}
