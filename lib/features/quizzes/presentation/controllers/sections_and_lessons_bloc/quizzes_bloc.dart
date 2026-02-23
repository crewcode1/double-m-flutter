import 'package:doublem/features/quizzes/domain/use_cases/get_questions_by_quiz_id_use_case.dart';
import 'package:doublem/features/quizzes/domain/use_cases/get_quiz_by_id_use_case.dart';
import 'package:doublem/features/quizzes/domain/use_cases/start_and_submit_quiz_use_case.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_event.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final GetQuizByIdUseCase getQuizByIdUseCase;
  final GetQuestionsByQuizIdUseCase getQuestionsByQuizIdUseCase;
  final StartAndSubmitQuizUseCase startAndSubmitQuizUseCase;

  QuizzesBloc({
    required this.getQuizByIdUseCase,
    required this.getQuestionsByQuizIdUseCase,
    required this.startAndSubmitQuizUseCase,
  }) : super(QuizzesInitial()) {
    on<LoadQuizEvent>(_onLoadQuiz);
    on<LoadQuestionsEvent>(_onLoadQuestions);
    on<StartQuizEvent>(_onStartQuiz);
    on<SubmitQuizEvent>(_onSubmitQuiz);
  }

  Future<void> _onLoadQuiz(
    LoadQuizEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(QuizLoading());

    final result = await getQuizByIdUseCase.call(
      quizId: event.quizId,
      courseId: event.courseId,
    );

    result.fold(
      (failure) => emit(QuizLoadingError(message: failure.errorMessage)),
      (quiz) => emit(QuizLoaded(quiz: quiz)),
    );
  }

  Future<void> _onStartQuiz(
    StartQuizEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(StartingQuiz());

    final result = await startAndSubmitQuizUseCase.startQuiz(
      quizId: event.quizId,
      courseId: event.courseId,
    );

    result.fold(
      (failure) => emit(StartingQuizError(message: failure.errorMessage)),
      (success) => emit(QuizStarted(success: success)),
    );
  }

  Future<void> _onSubmitQuiz(
    SubmitQuizEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(SubmittingQuiz());

    final result = await startAndSubmitQuizUseCase.submitQuiz(
      quizId: event.quizId,
      courseId: event.courseId,
      data: event.data,
    );

    result.fold(
      (failure) => emit(QuizSubmittionError(message: failure.errorMessage)),
      (success) => emit(QuizSubmitted(success: success)),
    );
  }

  Future<void> _onLoadQuestions(
    LoadQuestionsEvent event,
    Emitter<QuizzesState> emit,
  ) async {
    emit(QuizLoading());

    final result = await getQuestionsByQuizIdUseCase.call(quizId: event.quizId);

    result.fold(
      (failure) => emit(QuizLoadingError(message: failure.errorMessage)),
      (questions) => emit(QuestionsLoaded(questions: questions)),
    );
  }
}
