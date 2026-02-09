import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theming_state.dart';

class ThemingCubit extends Cubit<ThemingState> {
  late bool _darkMode;
  ThemingCubit() : super(ThemingStateInitial(darkMode: false)) {
    _darkMode = _checkTheme();
    emit(ThemingState(darkMode: _darkMode));
  }
  bool get darkMode => _darkMode;
  static ThemingCubit get(BuildContext context) =>
      BlocProvider.of<ThemingCubit>(context);
  bool _checkTheme() {
    bool theme = CacheUtils().getBool(key: 'darkMode') ?? false;
    return theme;
  }

  void setDarkMode(bool theme) {
    if (_darkMode != theme) {
      _darkMode = theme;
      CacheUtils().setBool(key: 'darkMode', value: _darkMode);
      emit(ChangeThemeState(darkMode: _darkMode));
    }
  }
}
