// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'verify_email_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailRequestBody _$VerifyEmailRequestBodyFromJson(Map json) =>
    VerifyEmailRequestBody(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyEmailRequestBodyToJson(
  VerifyEmailRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
