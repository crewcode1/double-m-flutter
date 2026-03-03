import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/lesson_entity.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
  final int id;
  final int sectionId;
  final int? videoType;
  final String? title;
  final String? description;
  final int? displayOrder;
  final String? videoUrl;
  final String? materialUrl;
  final int? durationMinutes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isCompleted;

  LessonModel({
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
    this.videoType,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  LessonEntity toEntity() => LessonEntity(
    id: id,
    sectionId: sectionId,
    title: title ?? '',
    description: description ?? '',
    displayOrder: displayOrder ?? 0,
    videoUrl: videoUrl ?? '',
    materialUrl: materialUrl ?? '',
    durationMinutes: durationMinutes ?? 30,
    videoType: videoType ?? 3,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isCompleted: isCompleted,
  );
}
