// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map json) => TeacherModel(
  teacher: json['teacher'] == null
      ? null
      : UserModel.fromJson(Map<String, dynamic>.from(json['teacher'] as Map)),
  courses: (json['courses'] as List<dynamic>?)
      ?.map((e) => CourseModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
  coursesCount: (json['coursesCount'] as num?)?.toInt(),
);
