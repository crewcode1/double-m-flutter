import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/use_cases/generic_use_case.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/confirm_email_request_body.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class ConfirmEmailUseCase extends UseCase<void, ConfirmEmailRequestBody> {
  final AuthRepository authRepository;
  ConfirmEmailUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call({ConfirmEmailRequestBody? parameters}) {
    return authRepository.confirmEmail(request: parameters!);
  }
}
