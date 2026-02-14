import 'package:json_annotation/json_annotation.dart';
import '../../../sections&lessons/data/models/section_model.dart';
import '../../../quizzes/data/models/quiz_model.dart';
import '../../domain/entities/course_entity.dart';

part 'course_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseModel {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? teacherId;
  final String? teacherName;
  final String? teacherProfileImageUrl;
  final String? category;
  final String? level;
  final int? durationHours;
  final bool? isPublished;
  final DateTime? publishedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<SectionModel>? sections;
  final List<QuizModel>? quizzes;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.teacherId,
    this.teacherName,
    this.teacherProfileImageUrl,
    this.category,
    this.level,
    required this.durationHours,
    required this.isPublished,
    this.publishedAt,
    required this.createdAt,
    this.updatedAt,
    this.sections,
    this.quizzes,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  CourseEntity toEntity() => CourseEntity(
    id: id ?? 0,
    title: title ?? 'Title',
    description: description ?? "Description",
    imageUrl: imageUrl,
    teacherId: teacherId ?? 'Sf5a5df@asdRqwr_dfcafds25435dcw2a4c',
    teacherName: teacherName ?? 'Teacher Name',
    teacherProfileImageUrl: teacherProfileImageUrl,
    category: category,
    level: level,
    durationHours: durationHours ?? 120,
    isPublished: isPublished ?? false,
    publishedAt: publishedAt,
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: updatedAt,
    sections: sections?.map((e) => e.toEntity()).toList(),
    quizzes: quizzes?.map((e) => e.toEntity()).toList(),
  );
}
