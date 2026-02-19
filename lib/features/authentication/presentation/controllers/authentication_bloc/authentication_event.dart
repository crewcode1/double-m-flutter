import 'package:doublem/features/authentication/data/models/requests_body_model/change_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/confirm_email_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/forgot_password_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/register_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/reset_password_request_body.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final LoginRequestBody request;
  const LoginRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class RegisterRequested extends AuthEvent {
  final RegisterRequestBody request;
  const RegisterRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class ForgotPasswordRequested extends AuthEvent {
  final ForgotPasswordRequestBody request;
  const ForgotPasswordRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class ResetPasswordRequested extends AuthEvent {
  final ResetPasswordRequestBody request;
  const ResetPasswordRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class ChangePasswordRequested extends AuthEvent {
  final ChangePasswordRequestBody request;
  const ChangePasswordRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class ConfirmEmailRequested extends AuthEvent {
  final ConfirmEmailRequestBody request;
  const ConfirmEmailRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class LogoutRequested extends AuthEvent {}

class LoadProfileRequested extends AuthEvent {}

class GeneratingParentCodeEvent extends AuthEvent {}
