import 'package:equatable/equatable.dart';
import 'lesson_entity.dart';

class SectionEntity extends Equatable {
  final int id;
  final int courseId;
  final String title;
  final int displayOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int lessonCount;
  final List<LessonEntity>? lessons;

  const SectionEntity({
    required this.id,
    required this.courseId,
    required this.title,
    required this.displayOrder,
    required this.createdAt,
    this.updatedAt,
    required this.lessonCount,
    this.lessons,
  });

  @override
  List<Object?> get props => [id];
}
