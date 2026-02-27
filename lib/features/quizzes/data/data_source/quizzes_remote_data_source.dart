import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/quizzes/data/models/quiz_model.dart';

abstract class QuizzesRemoteDataSource {
  Future<QuizModel> getQuizById({required int quizId, required int courseId});
  Future<bool> startQuiz({required int quizId, required int courseId});
  Future<bool> submitQuiz({
    required int quizId,
    required int courseId,
    required Map<String, List<int>> data,
  });
}

class QuizzesRemoteDataSourceImpl implements QuizzesRemoteDataSource {
  final ApiServices apiServices;
  QuizModel parsingQuiz(Response response) {
    dynamic data = response.data['data'];
    QuizModel quizModel = QuizModel.fromJson(data);
    return quizModel;
  }

  bool postingQuiz(Response response) {
    dynamic data = response.data['success'];
    bool success = data as bool;
    return success;
  }

  QuizzesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<QuizModel> getQuizById({
    required int courseId,
    required int quizId,
  }) async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    String? userToken = CacheUtils().getString(key: 'userToken');
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.courses}s/$courseId/${EndPoints.quizzes}/$quizId',
      token: userToken,
      deviceToken: deviceToken,
    );
    return parsingQuiz(response);
  }

  @override
  Future<bool> startQuiz({required int quizId, required int courseId}) async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');
    final Response response = await apiServices.post(
      endPoint:
          '${EndPoints.courses}s/$courseId/${EndPoints.quizzes}/$quizId/${EndPoints.start}',
      token: userToken,
      deviceToken: deviceToken,
    );
    return postingQuiz(response);
  }

  @override
  Future<bool> submitQuiz({
    required int quizId,
    required int courseId,
    required Map<String, List<int>> data,
  }) async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    String? userToken = CacheUtils().getString(key: 'userToken');
    final Response response = await apiServices.post(
      endPoint:
          '${EndPoints.courses}s/$courseId/${EndPoints.quizzes}/$quizId/${EndPoints.submit}',
      token: userToken,
      data: data,
      deviceToken: deviceToken,
    );
    return postingQuiz(response);
  }
}
