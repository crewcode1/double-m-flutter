import 'package:json_annotation/json_annotation.dart';

part 'biometrics_login_request_body.g.dart';

@JsonSerializable(createToJson: true)
class BiometricLoginRequestBody {
  final String biometricToken;
  final String deviceId;
  final int clientType;

  BiometricLoginRequestBody({
    required this.biometricToken,
    required this.deviceId,
    required this.clientType,
  });

  Map<String, dynamic> toJson() => _$BiometricLoginRequestBodyToJson(this);
}
