import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';

abstract class QuizzesState {}

class QuizzesInitial extends QuizzesState {}

class QuizzesLoading extends QuizzesState {}

class QuizLoaded extends QuizzesState {
  final QuizEntity quiz;

  QuizLoaded({required this.quiz});
}

class QuestionsLoaded extends QuizzesState {
  final List<QuestionEntity> questions;

  QuestionsLoaded({required this.questions});
}

class QuizzesError extends QuizzesState {
  final String message;

  QuizzesError({required this.message});
}
