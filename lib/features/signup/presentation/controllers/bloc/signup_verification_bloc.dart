import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_verification_event.dart';
part 'signup_verification_state.dart';

class SignupVerificationBloc
    extends Bloc<SignupVerificationEvent, SignupVerificationState> {
  SignupVerificationBloc() : super(SignupVerificationInitial()) {
    on<CodeSubmittedEvent>(_onVerify);
  }
  void _onVerify(CodeSubmittedEvent code, Emitter<SignupVerificationState> emit) {
    emit(VerifyingState());
    emit(CodeVerifiedSuccessfullyState());
    emit(ErrorVerifyingCodeState(errorMessage: ''));
  }
}
