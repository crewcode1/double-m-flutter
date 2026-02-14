// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionModel _$OptionModelFromJson(Map json) => OptionModel(
  id: (json['id'] as num).toInt(),
  questionId: (json['questionId'] as num).toInt(),
  text: json['text'] as String,
  isCorrect: json['isCorrect'] as bool,
  displayOrder: (json['displayOrder'] as num).toInt(),
);
