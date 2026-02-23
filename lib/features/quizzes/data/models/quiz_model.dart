import 'package:json_annotation/json_annotation.dart';
import 'question_model.dart';
import '../../domain/entities/quiz_entity.dart';

part 'quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel {
  final int id;
  final int courseId;
  final String title;
  final String description;
  final bool isActive;
  final int timeLimitMinutes;
  final bool allowReentry;
  final int? attemptsAllowed;
  final int passingScore;
  final int? studentScore;
  final bool showCorrectAnswers;
  final List<QuestionModel>? questions;

  QuizModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.isActive,
    required this.timeLimitMinutes,
    required this.allowReentry,
    this.attemptsAllowed,
    required this.passingScore,
    required this.showCorrectAnswers,
    this.questions,
    this.studentScore,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  QuizEntity toEntity() => QuizEntity(
    id: id,
    courseId: courseId,
    title: title,
    description: description,
    isActive: isActive,
    timeLimitMinutes: timeLimitMinutes,
    allowReentry: allowReentry,
    attemptsAllowed: attemptsAllowed,
    passingScore: passingScore,
    showCorrectAnswers: showCorrectAnswers,
    studentScore: studentScore,
    questions: questions?.map((e) => e.toEntity()).toList(),
  );
}
