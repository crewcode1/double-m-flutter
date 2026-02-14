import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/quizzes/data/data_source/questions_remote_data_source.dart';
import 'package:doublem/features/quizzes/data/data_source/quizzes_remote_data_source.dart';
import 'package:doublem/features/quizzes/data/repositories/quizzes_repository_impl.dart';
import 'package:doublem/features/quizzes/domain/repositories/quizzes_repository.dart';
import 'package:doublem/features/quizzes/domain/use_cases/get_questions_by_quiz_id_use_case.dart';
import 'package:doublem/features/quizzes/domain/use_cases/get_quiz_by_id_use_case.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_bloc.dart';

void initQuizzesInjection() {
  // Bloc
  getIt.registerFactory(
    () => QuizzesBloc(
      getQuizByIdUseCase: getIt(),
      getQuestionsByQuizIdUseCase: getIt(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(() => GetQuizByIdUseCase(repository: getIt()));

  getIt.registerLazySingleton(
    () => GetQuestionsByQuizIdUseCase(repository: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<QuizzesRepository>(
    () => QuizzesRepositoryImpl(
      quizzesRemoteDataSource: getIt(),
      questionsRemoteDataSource: getIt(),
    ),
  );

  // Data Sources
  getIt.registerLazySingleton<QuizzesRemoteDataSource>(
    () => QuizzesRemoteDataSourceImpl(apiServices: getIt()),
  );

  getIt.registerLazySingleton<QuestionsRemoteDataSource>(
    () => QuestionsRemoteDataSourceImpl(apiServices: getIt()),
  );
}
