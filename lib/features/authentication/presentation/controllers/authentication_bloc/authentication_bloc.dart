import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/authentication/domain/entities/authentication_session.dart';
import 'package:doublem/features/authentication/domain/use_cases/change_password_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/confirm_email_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/forgot_password_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/load_profile_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/logout_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/reset_password_use_case.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_event.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final ConfirmEmailUseCase confirmEmailUseCase;
  final LogoutUseCase logoutUseCase;
  final LoadProfileUseCase loadProfileUseCase;

  AuthenticationBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgotPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.changePasswordUseCase,
    required this.confirmEmailUseCase,
    required this.logoutUseCase,
    required this.loadProfileUseCase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<ForgotPasswordRequested>(_onForgotPassword);
    on<ResetPasswordRequested>(_onResetPassword);
    on<ChangePasswordRequested>(_onChangePassword);
    on<ConfirmEmailRequested>(_onConfirmEmail);
    on<LogoutRequested>(_onLogout);
    on<LoadProfileRequested>(_onLoadProfile);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final Either<Failure, AuthSession> result = await loginUseCase.call(
      parameters: event.request,
    );
    result.fold((f) => emit(AuthError(f)), (session) {
      _cachingLoggedInUser(userToken: session.token);
      emit(Authenticated());
    });
  }

  Future<void> _onRegister(RegisterRequested event, Emitter<void> emit) async {
    emit(AuthLoading());
    final Either result = await registerUseCase.call(parameters: event.request);
    result.fold((f) => emit(AuthError(f)), (session) => emit(Authenticated()));
  }

  Future<void> _onForgotPassword(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either result = await forgotPasswordUseCase.call(
      parameters: event.request,
    );
    result.fold(
      (f) => emit(AuthError(f)),
      (_) => emit(const AuthActionSuccess('Reset password email sent')),
    );
  }

  Future<void> _onResetPassword(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either result = await resetPasswordUseCase.call(
      parameters: event.request,
    );
    result.fold(
      (f) => emit(AuthError(f)),
      (_) => emit(const AuthActionSuccess('Password reset successfully')),
    );
  }

  Future<void> _onChangePassword(
    ChangePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either result = await changePasswordUseCase.call(
      parameters: event.request,
    );
    result.fold(
      (f) => emit(AuthError(f)),
      (_) => emit(const AuthActionSuccess('Password changed successfully')),
    );
  }

  Future<void> _onConfirmEmail(
    ConfirmEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final Either result = await confirmEmailUseCase.call(
      parameters: event.request,
    );
    result.fold(
      (f) => emit(AuthError(f)),
      (_) => emit(const AuthActionSuccess('Email confirmed successfully')),
    );
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await logoutUseCase.call();
    _clearingLoggedInUserData();
    emit(Unauthenticated());
  }

  Future<void> _onLoadProfile(
    LoadProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingProfile());
    final Either result = await loadProfileUseCase.call();
    result.fold((f) => emit(ProfileLoadError(f)), (profile) {
      emit(ProfileLoaded(user: profile));
    });
  }

  void _cachingLoggedInUser({required String userToken}) {
    CacheUtils().setString(key: 'userToken', value: userToken);
  }

  void _clearingLoggedInUserData() {
    CacheUtils().remove(key: 'userToken');
  }
}
