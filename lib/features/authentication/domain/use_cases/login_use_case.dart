import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/domain/entities/authentication_session.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class Login {
  final AuthRepository repo;
  Login(this.repo);

  Future<Either<String, AuthSession>> call(LoginRequest request) {
    return repo.login(request);
  }
}
