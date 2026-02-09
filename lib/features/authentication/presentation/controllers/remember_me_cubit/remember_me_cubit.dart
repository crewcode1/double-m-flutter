import 'package:flutter_bloc/flutter_bloc.dart';

part 'remember_me_state.dart';

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(RememberMeInitial());
  bool rememberMe = false;
  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState());
  }
}
