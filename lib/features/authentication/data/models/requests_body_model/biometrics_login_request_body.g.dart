// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'biometrics_login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricLoginRequestBody _$BiometricLoginRequestBodyFromJson(Map json) =>
    BiometricLoginRequestBody(
      biometricToken: json['biometricToken'] as String,
      deviceId: json['deviceId'] as String,
      clientType: (json['clientType'] as num).toInt(),
    );

Map<String, dynamic> _$BiometricLoginRequestBodyToJson(
  BiometricLoginRequestBody instance,
) => <String, dynamic>{
  'biometricToken': instance.biometricToken,
  'deviceId': instance.deviceId,
  'clientType': instance.clientType,
};
