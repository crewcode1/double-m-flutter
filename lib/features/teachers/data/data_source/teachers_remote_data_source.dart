import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/features/course/data/models/course_model.dart';
import 'package:doublem/features/teachers/data/models/teacher_model.dart';

abstract class TeachersRemoteDataSource {
  Future<TeacherModel> getTeacherById({required String teacherId});

  Future<List<CourseModel>> getTeacherCourses({required String teacherId});
  Future<List<TeacherModel>> getAllTeachers();
}

class TeachersRemoteDataSourceImpl implements TeachersRemoteDataSource {
  final ApiServices apiServices;

  TeachersRemoteDataSourceImpl({required this.apiServices});

  TeacherModel parsingTeacher(Response response) {
    dynamic data = response.data['data'];
    TeacherModel teacher = TeacherModel.fromJson(data);
    return teacher;
  }

  List<CourseModel> parsingCourses(Response response) {
    List<dynamic> dataList = response.data['data'];
    List<CourseModel> courses = dataList
        .map((courseJson) => CourseModel.fromJson(courseJson))
        .toList();
    return courses;
  }

  List<TeacherModel> parsingTeachers(Response response) {
    List<dynamic> dataList = response.data['data'];
    List<TeacherModel> teachers = dataList
        .map((teacherJson) => TeacherModel.fromJson(teacherJson))
        .toList();
    return teachers;
  }

  @override
  Future<TeacherModel> getTeacherById({required String teacherId}) async {
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.teachers}/$teacherId',
    );
    return parsingTeacher(response);
  }

  @override
  Future<List<CourseModel>> getTeacherCourses({
    required String teacherId,
  }) async {
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.teachers}/${EndPoints.courses}',
    );

    return parsingCourses(response);
  }

  @override
  Future<List<TeacherModel>> getAllTeachers() async {
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.teachers}/all',
    );

    return parsingTeachers(response);
  }
}
