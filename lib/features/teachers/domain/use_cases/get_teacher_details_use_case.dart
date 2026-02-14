import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_details_entity.dart';
import 'package:doublem/features/teachers/domain/repositories/teachers_repository.dart';

class GetTeacherDetailsUseCase {
  final TeachersRepository repository;

  GetTeacherDetailsUseCase({required this.repository});

  Future<Either<Failure, TeacherDetailsEntity>> call({
    required String teacherId,
  }) async {
    final teacherResult = await repository.getTeacherById(teacherId: teacherId);

    return teacherResult.fold((failure) => Either.failed(failure), (
      teacher,
    ) async {
      final coursesResult = await repository.getTeacherCourses(
        teacherId: teacherId,
      );

      return coursesResult.fold(
        (failure) => Either.failed(failure),
        (courses) => Either.succeed(
          TeacherDetailsEntity(teacher: teacher, courses: courses),
        ),
      );
    });
  }
}
