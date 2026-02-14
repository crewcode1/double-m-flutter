import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  final int id;
  final int questionId;
  final String text;
  final bool isCorrect;
  final int displayOrder;

  const OptionEntity({
    required this.id,
    required this.questionId,
    required this.text,
    required this.isCorrect,
    required this.displayOrder,
  });

  @override
  List<Object?> get props => [id];
}
