abstract class QuizzesEvent {}

class LoadQuizEvent extends QuizzesEvent {
  final int quizId;
  final int courseId;

  LoadQuizEvent({required this.quizId, required this.courseId});
}

class StartQuizEvent extends QuizzesEvent {
  final int quizId;
  final int courseId;

  StartQuizEvent({required this.quizId, required this.courseId});
}

class SubmitQuizEvent extends QuizzesEvent {
  final int quizId;
  final int courseId;
  final Map<String, List<int>> data;

  SubmitQuizEvent({
    required this.quizId,
    required this.courseId,
    required this.data,
  });
}

class LoadQuestionsEvent extends QuizzesEvent {
  final int quizId;

  LoadQuestionsEvent({required this.quizId});
}
