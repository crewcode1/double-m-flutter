import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_body.g.dart';

@JsonSerializable(createToJson: true)
class ResetPasswordRequestBody {
  final String userId;
  final String token;
  final String newPassword;
  @JsonKey(name: 'confirmPassWord')
  final String confirmNewPassword;
  ResetPasswordRequestBody({
    required this.userId,
    required this.token,
    required this.newPassword,
    required this.confirmNewPassword,
  });
  Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}
