import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/no_parameters/no_parameters_model.dart';
import 'package:doublem/core/use_cases/generic_use_case.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class LogoutUseCase extends UseCase<void, NoParameters> {
  final AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  @override
  Future<Either<Failure, void>> call({NoParameters? parameters}) {
    return authRepository.logout();
  }
}
