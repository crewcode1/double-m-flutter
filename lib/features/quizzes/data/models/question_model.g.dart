// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map json) => QuestionModel(
  id: (json['id'] as num).toInt(),
  quizId: (json['quizId'] as num).toInt(),
  text: json['text'] as String,
  questionType: json['questionType'] as String,
  points: (json['points'] as num).toInt(),
  displayOrder: (json['displayOrder'] as num).toInt(),
  difficultyLevel: json['difficultyLevel'] as String?,
  explanation: json['explanation'] as String?,
  options: (json['options'] as List<dynamic>)
      .map((e) => OptionModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);
