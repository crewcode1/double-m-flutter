import 'user.dart';

class AuthSession {
  final String token;
  final String refreshToken;
  final DateTime expiresAt;
  final User user;

  AuthSession({
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
    required this.user,
  });
}
