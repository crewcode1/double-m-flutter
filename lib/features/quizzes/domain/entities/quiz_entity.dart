import 'package:equatable/equatable.dart';
import 'question_entity.dart';

class QuizEntity extends Equatable {
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
  final List<QuestionEntity>? questions;

  const QuizEntity({
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

  @override
  List<Object?> get props => [id];
}
