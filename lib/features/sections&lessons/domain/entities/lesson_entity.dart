import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final int id;
  final int sectionId;
  final String title;
  final String description;
  final int displayOrder;
  final String videoUrl;
  final String materialUrl;
  final int durationMinutes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isCompleted;

  const LessonEntity({
    required this.id,
    required this.sectionId,
    required this.title,
    required this.description,
    required this.displayOrder,
    required this.videoUrl,
    required this.materialUrl,
    required this.durationMinutes,
    required this.createdAt,
    this.updatedAt,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id];
}
