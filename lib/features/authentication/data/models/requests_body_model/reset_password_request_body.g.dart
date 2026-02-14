// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestBody _$ResetPasswordRequestBodyFromJson(Map json) =>
    ResetPasswordRequestBody(
      userId: json['userId'] as String,
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
      confirmNewPassword: json['confirmPassWord'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestBodyToJson(
  ResetPasswordRequestBody instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'token': instance.token,
  'newPassword': instance.newPassword,
  'confirmPassWord': instance.confirmNewPassword,
};
