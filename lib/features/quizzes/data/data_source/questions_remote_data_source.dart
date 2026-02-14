import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/features/quizzes/data/models/question_model.dart';

abstract class QuestionsRemoteDataSource {
  Future<List<QuestionModel>> getQuestionsByQuizId({required int quizId});
}

class QuestionsRemoteDataSourceImpl implements QuestionsRemoteDataSource {
  List<QuestionModel> parsingquestions(Response response) {
    List<dynamic> dataList = response.data['data'];
    List<QuestionModel> questions = dataList
        .map((questionJson) => QuestionModel.fromJson(questionJson))
        .toList();
    return questions;
  }

  final ApiServices apiServices;
  QuestionsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<QuestionModel>> getQuestionsByQuizId({
    required int quizId,
  }) async {
    final Response response = await apiServices.get(
      endPoint: EndPoints.section,
      token: '',
    );
    return parsingquestions(response);
  }
}
