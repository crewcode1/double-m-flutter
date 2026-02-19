import 'package:equatable/equatable.dart';
import '../../../sections&lessons/domain/entities/section_entity.dart';
import '../../../quizzes/domain/entities/quiz_entity.dart';

class CourseEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String teacherId;
  final String teacherName;
  final String teacherProfileImageUrl;
  final String category;
  final String level;
  final int durationHours;
  final bool isPublished;
  final DateTime? publishedAt;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<SectionEntity>? sections;
  final List<QuizEntity>? quizzes;

  const CourseEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.teacherId,
    required this.teacherName,
    required this.teacherProfileImageUrl,
    required this.category,
    required this.level,
    required this.durationHours,
    required this.isPublished,
    this.publishedAt,
    required this.createdAt,
    this.updatedAt,
    this.sections,
    this.quizzes,
  });

  @override
  List<Object?> get props => [id];
}
