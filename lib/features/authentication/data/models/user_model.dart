import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String? photoUrl;
  final String? specialty;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final String language;
  final bool darkMode;
  final List<String> roles;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.photoUrl,
    this.specialty,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.language,
    required this.darkMode,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  User toEntity() => User(
    id: id,
    email: email,
    fullName: fullName,
    phoneNumber: phoneNumber,
    photoUrl: photoUrl,
    specialty: specialty,
    description: description,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isActive: isActive,
    language: language,
    darkMode: darkMode,
    roles: roles,
  );
}
