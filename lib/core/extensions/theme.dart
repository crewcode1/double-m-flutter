import 'package:doublem/core/theme/theming/colors/app_colors_scheme.dart';
import 'package:doublem/core/theme/theming/theme.dart';
import 'package:flutter/material.dart';

extension ThemeApp on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);

  AppColorsScheme get colorScheme => AppTheme.appColors;

  Color get primaryColor => Theme.of(this).primaryColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
