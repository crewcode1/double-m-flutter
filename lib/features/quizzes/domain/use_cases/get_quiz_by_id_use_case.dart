import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/domain/repositories/quizzes_repository.dart';

class GetQuizByIdUseCase {
  final QuizzesRepository repository;

  GetQuizByIdUseCase({required this.repository});

  Future<Either<Failure, QuizEntity>> call({required int quizId}) {
    return repository.getQuizById(quizId: quizId);
  }
}
