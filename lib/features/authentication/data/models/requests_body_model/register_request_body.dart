import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable(createToJson: true)
class RegisterRequestBody {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final String role;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
