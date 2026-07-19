import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/resend_verification_otp_request_body.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/verify_email_request_body.dart';
import 'package:doublem/features/authentication/domain/use_cases/resend_verification_otp_use_case.dart';
import 'package:doublem/features/authentication/domain/use_cases/verify_email_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_verification_event.dart';
part 'signup_verification_state.dart';

class SignupVerificationBloc
    extends Bloc<SignupVerificationEvent, SignupVerificationState> {
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResendVerificationOtpUseCase resendVerificationOtpUseCase;

  SignupVerificationBloc({
    required this.verifyEmailUseCase,
    required this.resendVerificationOtpUseCase,
  }) : super(SignupVerificationInitial()) {
    on<CodeSubmittedEvent>(_onVerify);
    on<ResendOtpPressedEvent>(_onResendOtp);
    on<OtpChangedEvent>(_onOtpChanged);
  }

  Future<void> _onVerify(
    CodeSubmittedEvent event,
    Emitter<SignupVerificationState> emit,
  ) async {
    if (event.code.length != 6) {
      emit(
        ErrorVerifyingCodeState(
          errorMessage: 'Please enter a valid 6-digit code',
        ),
      );
      return;
    }

    emit(VerifyingState());

    final Either<Failure, void> result = await verifyEmailUseCase.call(
      parameters: VerifyEmailRequestBody(email: event.email, otp: event.code),
    );

    result.fold(
      (failure) => emit(
        ErrorVerifyingCodeState(errorMessage: _messageFromFailure(failure)),
      ),
      (_) => emit(CodeVerifiedSuccessfullyState()),
    );
  }

  Future<void> _onResendOtp(
    ResendOtpPressedEvent event,
    Emitter<SignupVerificationState> emit,
  ) async {
    emit(ResendLoadingState());

    final Either<Failure, void> result = await resendVerificationOtpUseCase
        .call(parameters: ResendVerificationOtpRequestBody(email: event.email));

    result.fold(
      (failure) =>
          emit(ResendErrorState(errorMessage: _messageFromFailure(failure))),
      (_) => emit(ResendSuccessState(message: 'OTP resent successfully')),
    );
  }

  void _onOtpChanged(
    OtpChangedEvent event,
    Emitter<SignupVerificationState> emit,
  ) {
    emit(SignupVerificationInitial());
  }

  String _messageFromFailure(Failure failure) {
    final message = failure.errorMessage.toString();
    if (message.isEmpty) {
      return 'Something went wrong';
    }
    if (message.contains('expired') ||
        message.toLowerCase().contains('expired')) {
      return 'This OTP has expired. Please request a new one.';
    }
    if (message.toLowerCase().contains('invalid') ||
        message.toLowerCase().contains('incorrect')) {
      return 'Invalid OTP. Please try again.';
    }
    if (message.toLowerCase().contains('network') ||
        message.toLowerCase().contains('internet') ||
        message.toLowerCase().contains('connection')) {
      return 'Please check your internet connection and try again.';
    }
    if (message.toLowerCase().contains('server') ||
        message.toLowerCase().contains('500')) {
      return 'Server error. Please try again later.';
    }
    return message;
  }
}
