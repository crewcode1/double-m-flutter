import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/quizzes/domain/repositories/quizzes_repository.dart';

class StartAndSubmitQuizUseCase {
  final QuizzesRepository repository;
  StartAndSubmitQuizUseCase({required this.repository});

  Future<Either<Failure, bool>> startQuiz({
    required int quizId,
    required int courseId,
  }) {
    return repository.startQuiz(quizId: quizId, courseId: courseId);
  }

  Future<Either<Failure, bool>> submitQuiz({
    required int quizId,
    required int courseId,
    required Map<String, List<int>> data,
  }) {
    return repository.submitQuiz(
      quizId: quizId,
      courseId: courseId,
      data: data,
    );
  }
}
