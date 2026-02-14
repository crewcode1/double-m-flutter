import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/course/data/data_source/courses_remote_data_source.dart';
import 'package:doublem/features/course/data/models/enrolled_course_model.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:doublem/features/course/domain/repositories/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesRemoteDataSource remoteDataSource;

  CoursesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<EnrolledCourse>>> getAllCourses() async {
    try {
      final dynamic coursesModel = await remoteDataSource.getAllCourses();
      final List<EnrolledCourseModel> courseModels =
          coursesModel as List<EnrolledCourseModel>;
      final List<EnrolledCourse> courses = courseModels
          .map((model) => model.toEntity())
          .toList();

      return Either.succeed(courses);
    } catch (e) {
      print('courses exception :$e');
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseById({
    required int courseId,
  }) async {
    try {
      final dynamic courseModel = await remoteDataSource.getCourseById(
        courseId: courseId,
      );
      return Either.succeed(courseModel.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> enrollInCourse({
    required String courseCode,
  }) async {
    try {
      await remoteDataSource.enrollInCourse(courseCode: courseCode);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      } else {
        return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
      }
    }
  }
}
