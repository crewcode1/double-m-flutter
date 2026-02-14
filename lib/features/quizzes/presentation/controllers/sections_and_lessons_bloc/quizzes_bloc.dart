import 'package:doublem/features/quizzes/domain/use_cases/get_questions_by_quiz_id_use_case.dart';
import 'package:doublem/features/quizzes/domain/use_cases/get_quiz_by_id_use_case.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_event.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final GetQuizByIdUseCase getQuizByIdUseCase;
  final GetQuestionsByQuizIdUseCase getQuestionsByQuizIdUseCase;

  QuizzesBloc({
    required this.getQuizByIdUseCase,
    required this.getQuestionsByQuizIdUseCase,
  }) : super(QuizzesInitial()) {
    on<LoadQuizEvent>(_onLoadQuiz);
    on<LoadQuestionsEvent>(_onLoadQuestions);
  }

  Future<void> _onLoadQuiz(
    LoadQuizEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(QuizzesLoading());

    final result = await getQuizByIdUseCase(quizId: event.quizId);

    result.fold(
      (failure) => emit(QuizzesError(message: failure.errorMessage)),
      (quiz) => emit(QuizLoaded(quiz: quiz)),
    );
  }

  Future<void> _onLoadQuestions(
    LoadQuestionsEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(QuizzesLoading());

    final result = await getQuestionsByQuizIdUseCase(quizId: event.quizId);

    result.fold(
      (failure) => emit(QuizzesError(message: failure.errorMessage)),
      (questions) => emit(QuestionsLoaded(questions: questions)),
    );
  }
}
