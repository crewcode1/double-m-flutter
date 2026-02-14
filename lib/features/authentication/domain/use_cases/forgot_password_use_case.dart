import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/use_cases/generic_use_case.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/forgot_password_request_body.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class ForgotPasswordUseCase extends UseCase<void, ForgotPasswordRequestBody> {
  final AuthRepository authRepository;
  ForgotPasswordUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call({ForgotPasswordRequestBody? parameters}) {
    return authRepository.forgotPassword(request: parameters!);
  }
}
