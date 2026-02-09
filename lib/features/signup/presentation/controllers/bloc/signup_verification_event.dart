part of 'signup_verification_bloc.dart';

abstract class SignupVerificationEvent {}

class CodeSubmittedEvent extends SignupVerificationEvent {
  final String code;
  CodeSubmittedEvent({required this.code});
}
