// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map json) => LessonModel(
  id: (json['id'] as num).toInt(),
  sectionId: (json['sectionId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  displayOrder: (json['displayOrder'] as num).toInt(),
  videoUrl: json['videoUrl'] as String,
  materialUrl: json['materialUrl'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  isCompleted: json['isCompleted'] as bool,
);
