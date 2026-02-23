import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';

abstract class QuizzesState {}

class QuizzesInitial extends QuizzesState {}

class StartingQuiz extends QuizzesState {}

// class QuizzesLoading extends QuizzesState {}

class QuizStarted extends QuizzesState {
  final bool success;

  QuizStarted({required this.success});
}

class StartingQuizError extends QuizzesState {
  final String message;
  StartingQuizError({required this.message});
}

class QuizLoading extends QuizzesState {}

class QuizLoaded extends QuizzesState {
  final QuizEntity quiz;

  QuizLoaded({required this.quiz});
}

class QuizLoadingError extends QuizzesState {
  final String message;

  QuizLoadingError({required this.message});
}

class SubmittingQuiz extends QuizzesState {}

class QuizSubmitted extends QuizzesState {
  final bool success;

  QuizSubmitted({required this.success});
}

class QuizSubmittionError extends QuizzesState {
  final String message;

  QuizSubmittionError({required this.message});
}

class QuestionsLoaded extends QuizzesState {
  final List<QuestionEntity> questions;

  QuestionsLoaded({required this.questions});
}
