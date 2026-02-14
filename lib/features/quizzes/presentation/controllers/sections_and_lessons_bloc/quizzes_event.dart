abstract class QuizzesEvent {}

class LoadQuizEvent extends QuizzesEvent {
  final int quizId;

  LoadQuizEvent({required this.quizId});
}

class LoadQuestionsEvent extends QuizzesEvent {
  final int quizId;

  LoadQuestionsEvent({required this.quizId});
}
