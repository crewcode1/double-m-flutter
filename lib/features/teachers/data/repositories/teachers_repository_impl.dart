import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/teachers/data/data_source/teachers_remote_data_source.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';
import 'package:doublem/features/teachers/domain/repositories/teachers_repository.dart';

class TeachersRepositoryImpl implements TeachersRepository {
  final TeachersRemoteDataSource remoteDataSource;

  TeachersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, TeacherEntity>> getTeacherById({
    required String teacherId,
  }) async {
    try {
      final model = await remoteDataSource.getTeacherById(teacherId: teacherId);
      return Either.succeed(model.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getTeacherCourses({
    required String teacherId,
  }) async {
    try {
      final models = await remoteDataSource.getTeacherCourses(
        teacherId: teacherId,
      );

      return Either.succeed(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TeacherEntity>>> getAllTeachers() async {
    try {
      final models = await remoteDataSource.getAllTeachers();

      return Either.succeed(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      print('object: $e');
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }
}
