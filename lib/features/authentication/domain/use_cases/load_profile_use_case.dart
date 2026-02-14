import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/authentication/domain/entities/user_profile.dart';
import 'package:doublem/features/authentication/domain/repositories/authentication_reository.dart';

class LoadProfileUseCase {
  final AuthRepository authRepository;
  LoadProfileUseCase({required this.authRepository});
  Future<Either<Failure, UserProfile>> call() {
    return authRepository.loadProfile();
  }
}
