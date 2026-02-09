import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';
import '../../domain/entities/auth_session.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final bool isSuccess;
  final String message;
  final String token;
  final String refreshToken;
  final DateTime expiresAt;
  final UserModel user;

  AuthResponseModel({
    required this.isSuccess,
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  AuthSession toEntity() => AuthSession(
    token: token,
    refreshToken: refreshToken,
    expiresAt: expiresAt,
    user: user.toEntity(),
  );
}
