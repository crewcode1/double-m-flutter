import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/features/sections&lessons/data/models/section_model.dart';

abstract class SectionsRemoteDataSource {
  Future<List<SectionModel>> getSectionsByCourseId({required int courseId});
}

class SectionsRemoteDataSourceImpl implements SectionsRemoteDataSource {
  List<SectionModel> parsingSections(Response response) {
    List<dynamic> dataList = response.data['data'];
    List<SectionModel> sections = dataList
        .map((sectionJson) => SectionModel.fromJson(sectionJson))
        .toList();
    return sections;
  }

  final ApiServices apiServices;

  SectionsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<SectionModel>> getSectionsByCourseId({
    required int courseId,
  }) async {
    final Response response = await apiServices.get(
      endPoint: EndPoints.section,
      token: '',
    );

    return parsingSections(response);
  }
}
