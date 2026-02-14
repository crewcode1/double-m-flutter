import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';
import 'package:doublem/features/teachers/domain/repositories/teachers_repository.dart';

class GetAllTeachersUseCase {
  final TeachersRepository repository;

  GetAllTeachersUseCase({required this.repository});

  Future<Either<Failure, List<TeacherEntity>>> call() async {
    final teachersResult = await repository.getAllTeachers();

    return teachersResult;
  }
}
