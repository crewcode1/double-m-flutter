// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map json) => CourseModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  teacherId: json['teacherId'] as String?,
  teacherName: json['teacherName'] as String?,
  teacherProfileImageUrl: json['teacherProfileImageUrl'] as String?,
  category: json['category'] as String?,
  level: json['level'] as String?,
  durationHours: (json['durationHours'] as num?)?.toInt(),
  isPublished: json['isPublished'] as bool?,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => SectionModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
  quizzes: (json['quizzes'] as List<dynamic>?)
      ?.map((e) => QuizModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);
