import 'package:doublem/features/authentication/data/models/user_model.dart';
import 'package:doublem/features/course/data/models/course_model.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeacherModel {
  UserModel? teacher;
  List<CourseModel>? courses;
  int? coursesCount;
  TeacherModel({
    required this.teacher,
    required this.courses,
    required this.coursesCount,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  TeacherEntity toEntity() => TeacherEntity(
    id: teacher?.id ?? '#djfbakARF25asdca7',
    email: teacher?.email ?? 'example@gmail.com',
    fullName: teacher?.fullName ?? 'Full Name',
    phoneNumber: teacher?.phoneNumber ?? '01111111111',
    profileImageUrl: teacher?.photoUrl,
    specialty: teacher?.specialty ?? 'Specialty',
    description: teacher?.description ?? 'Description',
    createdAt: teacher?.createdAt ?? DateTime.now(),
    updatedAt: teacher?.updatedAt ?? DateTime.now(),
    isActive: teacher?.isActive ?? false,
    language: teacher?.language ?? 'en',
    darkMode: teacher?.darkMode ?? false,
    roles: teacher?.roles ?? [],
  );
}
