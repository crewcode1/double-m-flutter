import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/domain/repositories/quizzes_repository.dart';

class GetQuestionsByQuizIdUseCase {
  final QuizzesRepository repository;

  GetQuestionsByQuizIdUseCase({required this.repository});

  Future<Either<Failure, List<QuestionEntity>>> call({required int quizId}) {
    return repository.getQuestionsByQuizId(quizId: quizId);
  }
}
