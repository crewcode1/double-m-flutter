import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/features/quizzes/data/models/quiz_model.dart';

abstract class QuizzesRemoteDataSource {
  Future<QuizModel> getQuizById({required int quizId});
}

class QuizzesRemoteDataSourceImpl implements QuizzesRemoteDataSource {
  final ApiServices apiServices;
  QuizModel parsingQuiz(Response response) {
    dynamic data = response.data['data'];
    QuizModel quizModel = QuizModel.fromJson(data);
    return quizModel;
  }

  QuizzesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<QuizModel> getQuizById({required int quizId}) async {
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.quiz}/$quizId',
    );
    return parsingQuiz(response);
  }
}
