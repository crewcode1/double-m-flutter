import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/use_cases/generic_use_case.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class ResetPasswordUseCase extends UseCase<void, ResetPasswordRequestBody> {
  final AuthRepository authRepository;
  ResetPasswordUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call({ResetPasswordRequestBody? parameters}) {
    return authRepository.resetPassword(request: parameters!);
  }
}
