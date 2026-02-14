import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';

abstract class QuizzesRepository {
  Future<Either<Failure, QuizEntity>> getQuizById({required int quizId});

  Future<Either<Failure, List<QuestionEntity>>> getQuestionsByQuizId({
    required int quizId,
  });
}
