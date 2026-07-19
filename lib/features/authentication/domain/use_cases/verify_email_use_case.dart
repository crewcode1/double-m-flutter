import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/use_cases/generic_use_case.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/verify_email_request_body.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class VerifyEmailUseCase extends UseCase<void, VerifyEmailRequestBody> {
  final AuthRepository authRepository;

  VerifyEmailUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call({VerifyEmailRequestBody? parameters}) {
    return authRepository.verifyEmail(request: parameters!);
  }
}
