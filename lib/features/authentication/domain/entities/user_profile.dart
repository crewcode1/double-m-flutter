import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String? photoUrl;
  final String? role;
  final DateTime? createdAt;

  const UserProfile({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.photoUrl,
    this.role,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id];
}
