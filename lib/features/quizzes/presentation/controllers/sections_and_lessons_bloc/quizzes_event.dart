abstract class QuizzesEvent {}

class LoadQuizEvent extends QuizzesEvent {
  final int quizId;
  final int courseId;

  LoadQuizEvent({required this.quizId, required this.courseId});
}

class LoadQuestionsEvent extends QuizzesEvent {
  final int quizId;

  LoadQuestionsEvent({required this.quizId});
}
