import 'package:json_annotation/json_annotation.dart';

part 'biometric_login_request.g.dart';

@JsonSerializable()
class BiometricLoginRequest {
  final String biometricToken;
  final String deviceId;
  final int clientType;

  BiometricLoginRequest({
    required this.biometricToken,
    required this.deviceId,
    required this.clientType,
  });

  Map<String, dynamic> toJson() => _$BiometricLoginRequestToJson(this);
}
