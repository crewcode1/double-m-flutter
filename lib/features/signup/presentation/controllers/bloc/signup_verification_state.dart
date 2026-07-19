part of 'signup_verification_bloc.dart';

abstract class SignupVerificationState extends Equatable {
  const SignupVerificationState();

  @override
  List<Object?> get props => [];
}

final class SignupVerificationInitial extends SignupVerificationState {}

final class VerifyingState extends SignupVerificationState {}

final class CodeVerifiedSuccessfullyState extends SignupVerificationState {}

final class ErrorVerifyingCodeState extends SignupVerificationState {
  final String errorMessage;

  const ErrorVerifyingCodeState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class ResendLoadingState extends SignupVerificationState {}

final class ResendSuccessState extends SignupVerificationState {
  final String message;

  const ResendSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ResendErrorState extends SignupVerificationState {
  final String errorMessage;

  const ResendErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
