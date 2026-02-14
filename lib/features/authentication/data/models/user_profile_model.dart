import 'package:doublem/features/authentication/domain/entities/user_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileModel {
  final String? id;
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  @JsonKey(name: 'profileImageUrl')
  final String? photoUrl;
  final String? role;

  UserProfileModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.photoUrl,
    required this.role,
  });
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  UserProfile toEntity() => UserProfile(
    id: id ?? 'Sf5sfVa5sfvSAFVa5sva',
    email: email ?? 'example@gmail.com',
    fullName: fullName ?? 'Full Name',
    phoneNumber: phoneNumber ?? '01234567891',
  );
}
