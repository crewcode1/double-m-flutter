import 'package:doublem/core/theme/theming/color_schemes/dark_color_scheme.dart';
import 'package:doublem/core/theme/theming/colors/app_colors_scheme.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final AppColorsScheme appDarkColorScheme = AppDarkColorScheme();

  static final theme = ThemeData(
    brightness: appDarkColorScheme.brightness,
    colorScheme: ColorScheme.dark(primary: appDarkColorScheme.primaryColor),
  );
}
