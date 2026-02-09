class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<String, AuthSession>> login(LoginRequest r) async {
    try {
      final res = await remote.login(r);
      return Right(res.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthSession>> register(RegisterRequest r) async {
    try {
      final res = await remote.register(r);
      return Right(res.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthSession>> biometricLogin(
    BiometricLoginRequest r,
  ) async {
    try {
      final res = await remote.biometricLogin(r);
      return Right(res.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> forgotPassword(ForgotPasswordRequest r) async {
    try {
      await remote.forgotPassword(r);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> resetPassword(ResetPasswordRequest r) async {
    try {
      await remote.resetPassword(r);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> changePassword(ChangePasswordRequest r) async {
    try {
      await remote.changePassword(r);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> confirmEmail(String userId, String token) async {
    try {
      await remote.confirmEmail(userId, token);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthSession>> refreshToken(String refreshToken) async {
    try {
      final res = await remote.refreshToken(refreshToken);
      return Right(res.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> logout() async {
    try {
      await remote.logout();
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
