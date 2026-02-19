import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/authentication/domain/entities/user_profile.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated();

  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthState {}

class AuthActionSuccess extends AuthState {
  final String message;
  const AuthActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthError extends AuthState {
  final Failure failure;
  const AuthError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class ProfileLoaded extends AuthState {
  final UserProfile user;
  const ProfileLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}

class LoadingProfile extends AuthState {}

class ProfileLoadError extends AuthState {
  final Failure failure;
  const ProfileLoadError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class GeneratingParentCode extends AuthState {
  const GeneratingParentCode();
}

class ParentCodeGenerated extends AuthState {
  final String code;
  const ParentCodeGenerated({required this.code});
  @override
  List<Object?> get props => [code];
}

class ErrorGeneratingParentCode extends AuthState {
  final String errorMessage;
  const ErrorGeneratingParentCode({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
