import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/option_entity.dart';

part 'option_model.g.dart';

@JsonSerializable()
class OptionModel {
  final int id;
  final int questionId;
  final String text;
  final bool isCorrect;
  final int displayOrder;

  OptionModel({
    required this.id,
    required this.questionId,
    required this.text,
    required this.isCorrect,
    required this.displayOrder,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  OptionEntity toEntity() => OptionEntity(
    id: id,
    questionId: questionId,
    text: text,
    isCorrect: isCorrect,
    displayOrder: displayOrder,
  );
}
