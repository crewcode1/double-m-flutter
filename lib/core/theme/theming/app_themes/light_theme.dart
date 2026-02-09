import 'package:doublem/core/theme/theming/color_schemes/light_color_scheme.dart';
import 'package:doublem/core/theme/theming/colors/app_colors_scheme.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final AppColorsScheme appLightColorScheme = AppLightColorScheme();
  static final theme = ThemeData(
    splashColor: appLightColorScheme.transparent,
    shadowColor: appLightColorScheme.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      selectedItemColor: appLightColorScheme.brownColor,
      backgroundColor: appLightColorScheme.beigeColor,
      unselectedLabelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.lightBrownColor,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.lightBrownColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appLightColorScheme.scaffoldBackgroundColor,
      surfaceTintColor: appLightColorScheme.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: appLightColorScheme.blueColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: appLightColorScheme.brightness,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(appLightColorScheme.blueColor),
      ),
    ),
    scaffoldBackgroundColor: appLightColorScheme.scaffoldBackgroundColor,
    iconTheme: IconThemeData(size: 24, color: appLightColorScheme.blueColor),
    colorScheme: ColorScheme.light(primary: appLightColorScheme.primaryColor),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blackColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blackColor,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blackColor,
      ),
      displayLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueGreyColor,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blueGreyColor,
      ),
      displaySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blueGreyColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blueColor,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.blueColor,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: appLightColorScheme.whiteColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: appLightColorScheme.lightBlueColor,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueGreyColor,
      ),
      helperStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: appLightColorScheme.blueGreyColor,
      ),
      suffixIconColor: appLightColorScheme.blueGreyColor,
    ),
  );
}
