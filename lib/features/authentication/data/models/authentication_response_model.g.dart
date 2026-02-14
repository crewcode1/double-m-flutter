// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'authentication_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map json) => AuthResponseModel(
  isSuccess: json['isSuccess'] as bool,
  message: json['message'] as String,
  token: json['token'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  user: UserModel.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
);
