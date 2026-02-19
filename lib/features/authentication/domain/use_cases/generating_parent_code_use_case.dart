import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class GeneratingParentCodeUseCase {
  final AuthRepository authRepository;
  GeneratingParentCodeUseCase({required this.authRepository});
  Future<Either<Failure, String>> call() {
    return authRepository.generateParentCode();
  }
}
