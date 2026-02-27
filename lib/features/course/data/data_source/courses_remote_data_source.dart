import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/course/data/models/course_model.dart';
import 'package:doublem/features/course/data/models/enrolled_course_model.dart';

abstract class CoursesRemoteDataSource {
  Future<List<EnrolledCourseModel>> getAllCourses();
  Future<CourseModel> getCourseById({required int courseId});
  Future<void> enrollInCourse({required String courseCode});
}

class CoursesRemoteDataSourceImpl implements CoursesRemoteDataSource {
  final ApiServices apiServices;

  List<EnrolledCourseModel> parsingCourses(Response response) {
    List<dynamic> dataList = response.data['data']['items'];
    List<EnrolledCourseModel> courses = dataList
        .map((courseJson) => EnrolledCourseModel.fromJson(courseJson))
        .toList();
    return courses;
  }

  CourseModel parsingCourse(Response response) {
    dynamic data = response.data['data'];
    CourseModel courses = CourseModel.fromJson(data);
    return courses;
  }

  CoursesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<EnrolledCourseModel>> getAllCourses() async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');
    final Response response = await apiServices.get(
      endPoint: EndPoints.enrollments,
      token: userToken,
      deviceToken: deviceToken,
    );

    return parsingCourses(response);
  }

  @override
  Future<CourseModel> getCourseById({required int courseId}) async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    final Response response = await apiServices.get(
      endPoint: '${EndPoints.courses}/$courseId',
      token: CacheUtils().getString(key: 'userToken'),
      deviceToken: deviceToken,
    );

    return parsingCourse(response);
  }

  @override
  Future<void> enrollInCourse({required String courseCode}) async {
    final Response response = await apiServices.post(
      endPoint: EndPoints.redeemCourse,
      token: CacheUtils().getString(key: 'userToken'),
      query: {"code": courseCode},
    );
    return response.data;
  }
}
