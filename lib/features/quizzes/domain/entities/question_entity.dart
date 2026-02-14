import 'package:equatable/equatable.dart';
import 'option_entity.dart';

class QuestionEntity extends Equatable {
  final int id;
  final int quizId;
  final String text;
  final String questionType;
  final int points;
  final int displayOrder;
  final String? difficultyLevel;
  final String? explanation;
  final List<OptionEntity> options;

  const QuestionEntity({
    required this.id,
    required this.quizId,
    required this.text,
    required this.questionType,
    required this.points,
    required this.displayOrder,
    this.difficultyLevel,
    this.explanation,
    required this.options,
  });

  @override
  List<Object?> get props => [id];
}
