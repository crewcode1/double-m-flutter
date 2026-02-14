import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/section_entity.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final int id;
  final int courseId;
  final String title;
  final int displayOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int lessonCount;

  SectionModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.displayOrder,
    required this.createdAt,
    this.updatedAt,
    required this.lessonCount,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  SectionEntity toEntity() => SectionEntity(
    id: id,
    courseId: courseId,
    title: title,
    displayOrder: displayOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
    lessonCount: lessonCount,
  );
}
