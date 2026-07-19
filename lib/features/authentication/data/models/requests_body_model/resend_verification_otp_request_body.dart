import 'package:json_annotation/json_annotation.dart';

part 'resend_verification_otp_request_body.g.dart';

@JsonSerializable(createToJson: true)
class ResendVerificationOtpRequestBody {
  final String email;

  ResendVerificationOtpRequestBody({required this.email});

  Map<String, dynamic> toJson() =>
      _$ResendVerificationOtpRequestBodyToJson(this);
}
