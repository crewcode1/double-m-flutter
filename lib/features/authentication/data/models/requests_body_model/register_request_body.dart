import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final String role;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
