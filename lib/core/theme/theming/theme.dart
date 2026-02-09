import 'package:doublem/core/enums/themes/themes_enum.dart';
import 'package:doublem/core/theme/theming/app_themes/dark_theme.dart';
import 'package:doublem/core/theme/theming/app_themes/light_theme.dart';
import 'package:doublem/core/theme/theming/colors/app_colors_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static late AppColorsScheme appColors;

  static final Map<Themes, ThemeData> themes = {
    Themes.light: _lightTheme,
    Themes.dark: _darkTheme,
  };
  static ThemeData getAppTheme(Themes theme) {
    switch (theme) {
      case Themes.light:
        appColors = LightTheme.appLightColorScheme;
        break;
      case Themes.dark:
        appColors = DarkTheme.appDarkColorScheme;
    }

    return themes[theme]!;
  }

  static final ThemeData _lightTheme = LightTheme.theme;

  static final ThemeData _darkTheme = DarkTheme.theme;
}
