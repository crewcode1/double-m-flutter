part of 'signup_verification_bloc.dart';

abstract class SignupVerificationState {}

final class SignupVerificationInitial extends SignupVerificationState {}

final class VerifyingState extends SignupVerificationState {}

final class CodeVerifiedSuccessfullyState extends SignupVerificationState {}

final class ErrorVerifyingCodeState extends SignupVerificationState {
  final String errorMessage;
  ErrorVerifyingCodeState({required this.errorMessage});
}
