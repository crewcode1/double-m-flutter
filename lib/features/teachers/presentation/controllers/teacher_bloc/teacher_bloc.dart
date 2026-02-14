import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';
import 'package:doublem/features/teachers/domain/use_cases/get_all_teachers_use_case.dart';
import 'package:doublem/features/teachers/domain/use_cases/get_teacher_details_use_case.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_event.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  final GetTeacherDetailsUseCase getTeacherDetailsUseCase;
  final GetAllTeachersUseCase getAllTeachersUseCase;

  TeachersBloc({
    required this.getTeacherDetailsUseCase,
    required this.getAllTeachersUseCase,
  }) : super(TeachersInitial()) {
    on<LoadTeacherDetailsEvent>(_onLoadTeacherDetails);
    on<LoadAllTeachersEvent>(_onLoadAllTeachers);
  }

  Future<void> _onLoadTeacherDetails(
    LoadTeacherDetailsEvent event,
    Emitter<TeachersState> emit,
  ) async {
    emit(TeachersLoading());

    final result = await getTeacherDetailsUseCase(teacherId: event.teacherId);

    result.fold(
      (failure) => emit(TeachersError(message: failure.errorMessage)),
      (details) => emit(TeacherDetailsLoaded(details: details)),
    );
  }

  Future<void> _onLoadAllTeachers(
    LoadAllTeachersEvent event,
    Emitter<TeachersState> emit,
  ) async {
    emit(LoadingAllTeachersState());

    final Either<Failure, List<TeacherEntity>> result =
        await getAllTeachersUseCase.call();

    result.fold(
      (failure) => emit(TeachersError(message: failure.errorMessage)),
      (teachers) => emit(AllTeachersLoadedState(teachers: teachers)),
    );
  }
}
