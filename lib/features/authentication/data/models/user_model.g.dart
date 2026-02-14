// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) => UserModel(
  id: json['id'] as String?,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  photoUrl: json['profileImageUrl'] as String?,
  specialty: json['specialty'] as String?,
  description: json['description'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  isActive: json['isActive'] as bool?,
  language: json['language'] as String?,
  darkMode: json['darkMode'] as bool?,
  roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
);
