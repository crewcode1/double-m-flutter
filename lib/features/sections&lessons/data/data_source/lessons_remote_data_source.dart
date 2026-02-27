import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/sections&lessons/data/models/lesson_model.dart';

abstract class LessonsRemoteDataSource {
  Future<List<LessonModel>> getLessonsBySectionId({required int sectionId});
}

class LessonsRemoteDataSourceImpl implements LessonsRemoteDataSource {
  List<LessonModel> parsingLessons(Response response) {
    List<dynamic> dataList = response.data['data'];
    List<LessonModel> sections = dataList
        .map((sectionJson) => LessonModel.fromJson(sectionJson))
        .toList();
    return sections;
  }

  final ApiServices apiServices;

  LessonsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<LessonModel>> getLessonsBySectionId({
    required int sectionId,
  }) async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    final Response response = await apiServices.get(
      endPoint: '${EndPoints.section}s/$sectionId/${EndPoints.lesson}',
      token: CacheUtils().getString(key: 'userToken'),
      deviceToken: deviceToken,
    );

    return parsingLessons(response);
  }
}
