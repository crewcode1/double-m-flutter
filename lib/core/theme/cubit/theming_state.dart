part of 'theming_cubit.dart';

class ThemingState {
  final bool darkMode;
  ThemingState({required this.darkMode});
}

class ThemingStateInitial extends ThemingState {
  ThemingStateInitial({required super.darkMode});
}

class ChangeThemeState extends ThemingState {
  ChangeThemeState({required super.darkMode});
}
