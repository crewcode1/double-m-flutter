import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/data/data_source/questions_remote_data_source.dart';
import 'package:doublem/features/quizzes/data/data_source/quizzes_remote_data_source.dart';
import 'package:doublem/features/quizzes/domain/repositories/quizzes_repository.dart';

class QuizzesRepositoryImpl implements QuizzesRepository {
  final QuizzesRemoteDataSource quizzesRemoteDataSource;
  final QuestionsRemoteDataSource questionsRemoteDataSource;

  QuizzesRepositoryImpl({
    required this.quizzesRemoteDataSource,
    required this.questionsRemoteDataSource,
  });

  @override
  Future<Either<Failure, QuizEntity>> getQuizById({required int quizId}) async {
    try {
      final model = await quizzesRemoteDataSource.getQuizById(quizId: quizId);
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
  Future<Either<Failure, List<QuestionEntity>>> getQuestionsByQuizId({
    required int quizId,
  }) async {
    try {
      final models = await questionsRemoteDataSource.getQuestionsByQuizId(
        quizId: quizId,
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
}
