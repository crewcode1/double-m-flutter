import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/quizzes/data/models/quiz_model.dart';

abstract class QuizzesRemoteDataSource {
  Future<QuizModel> getQuizById({required int quizId, required int courseId});
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
  Future<QuizModel> getQuizById({
    required int courseId,
    required int quizId,
  }) async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.courses}s/$courseId/${EndPoints.quizzes}/$quizId',
      token: userToken,
    );
    return parsingQuiz(response);
  }
}
