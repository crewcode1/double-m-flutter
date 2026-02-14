import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_request_body.g.dart';

@JsonSerializable(createToJson: true)
class ConfirmEmailRequestBody {
  final String userId;
  final String token;

  ConfirmEmailRequestBody({required this.userId, required this.token});

  Map<String, dynamic> toJson() => _$ConfirmEmailRequestBodyToJson(this);
}
