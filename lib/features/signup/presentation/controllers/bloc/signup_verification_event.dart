part of 'signup_verification_bloc.dart';

abstract class SignupVerificationEvent extends Equatable {
  const SignupVerificationEvent();

  @override
  List<Object?> get props => [];
}

class CodeSubmittedEvent extends SignupVerificationEvent {
  final String code;
  final String email;

  const CodeSubmittedEvent({required this.code, required this.email});

  @override
  List<Object?> get props => [code, email];
}

class ResendOtpPressedEvent extends SignupVerificationEvent {
  final String email;

  const ResendOtpPressedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class OtpChangedEvent extends SignupVerificationEvent {
  final String otp;

  const OtpChangedEvent({required this.otp});

  @override
  List<Object?> get props => [otp];
}
