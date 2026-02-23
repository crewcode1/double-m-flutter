import 'package:doublem/core/enums/types/question_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'option_model.dart';
import '../../domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  final int id;
  final int quizId;
  final String text;
  final String questionType;
  final int points;
  final int displayOrder;
  final String? difficultyLevel;
  final String? explanation;
  final List<OptionModel> options;

  QuestionModel({
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

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  QuestionTypeEnum convertQuestionType({required String questionType}) {
    switch (questionType) {
      case 'MultipleChoice':
        return QuestionTypeEnum.multipleChoice;
      case 'MultipleSelect':
        return QuestionTypeEnum.multipleSelect;
      case 'TrueFalse':
        return QuestionTypeEnum.trueOrFalse;
      default:
        return QuestionTypeEnum.multipleChoice;
    }
  }

  QuestionEntity toEntity() => QuestionEntity(
    id: id,
    quizId: quizId,
    text: text,
    questionType: convertQuestionType(questionType: questionType),
    points: points,
    displayOrder: displayOrder,
    difficultyLevel: difficultyLevel,
    explanation: explanation,
    options: options.map((e) => e.toEntity()).toList(),
  );
}
