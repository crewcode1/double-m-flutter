// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map json) => QuizModel(
  id: (json['id'] as num).toInt(),
  courseId: (json['courseId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  isActive: json['isActive'] as bool,
  timeLimitMinutes: (json['timeLimitMinutes'] as num).toInt(),
  allowReentry: json['allowReentry'] as bool,
  attemptsAllowed: (json['attemptsAllowed'] as num?)?.toInt(),
  passingScore: (json['passingScore'] as num).toInt(),
  showCorrectAnswers: json['showCorrectAnswers'] as bool,
  questions: (json['questions'] as List<dynamic>?)
      ?.map((e) => QuestionModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);
