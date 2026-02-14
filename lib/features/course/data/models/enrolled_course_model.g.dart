// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'enrolled_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledCourseModel _$EnrolledCourseModelFromJson(Map json) =>
    EnrolledCourseModel(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['courseId'] as num?)?.toInt(),
      courseTitle: json['courseTitle'] as String?,
      courseImageUrl: json['courseImageUrl'] as String?,
      teacherName: json['teacherName'] as String?,
      enrolledAt: json['enrolledAt'] == null
          ? null
          : DateTime.parse(json['enrolledAt'] as String),
    );
