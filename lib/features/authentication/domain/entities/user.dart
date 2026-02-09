import 'package:equatable/equatable.dart';

class User extends Equatable {
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

  const User({
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

  @override
  List<Object?> get props => [id];
}
