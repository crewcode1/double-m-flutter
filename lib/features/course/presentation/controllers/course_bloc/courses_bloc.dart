import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/course/domain/use_cases/enroll_in_course_use_case.dart';
import 'package:doublem/features/course/domain/use_cases/get_all_courses_use_case.dart';
import 'package:doublem/features/course/domain/use_cases/get_course_by_id_use_case.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_event.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetAllCoursesUseCase getAllCoursesUseCase;
  final GetCourseByIdUseCase getCourseByIdUseCase;
  final EnrollInCourseUseCase enrollInCourseUseCase;

  CoursesBloc({
    required this.getAllCoursesUseCase,
    required this.getCourseByIdUseCase,
    required this.enrollInCourseUseCase,
  }) : super(CoursesInitial()) {
    on<LoadAllCoursesEvent>(_onLoadAllCourses);
    on<LoadCourseDetailsEvent>(_onLoadCourseDetails);
    on<EnrollInCourseRequestEvent>(_onCourseEnrollment);
  }

  Future<void> _onLoadAllCourses(
    LoadAllCoursesEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CoursesLoading());

    final result = await getAllCoursesUseCase();

    result.fold(
      (failure) => emit(CoursesError(message: failure.errorMessage)),
      (courses) => emit(CoursesLoaded(courses: courses)),
    );
  }

  Future<void> _onLoadCourseDetails(
    LoadCourseDetailsEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CoursesLoading());

    final result = await getCourseByIdUseCase(courseId: event.courseId);

    result.fold(
      (failure) => emit(CoursesError(message: failure.errorMessage)),
      (course) => emit(CourseDetailsLoaded(course: course)),
    );
  }

  void _onCourseEnrollment(
    EnrollInCourseRequestEvent event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CourseEnrollmentLoading());
    final Either<Failure, void> result = await enrollInCourseUseCase.call(
      courseCode: event.courseCode,
    );
    result.fold(
      (failure) => emit(CourseEnrollmentError(message: failure.errorMessage)),
      (_) => emit(CourseEnrolled()),
    );
  }
}
