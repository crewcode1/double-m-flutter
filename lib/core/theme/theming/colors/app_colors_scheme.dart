import 'package:doublem/core/theme/theming/colors/material_colors.dart';
import 'package:flutter/material.dart';

abstract class AppColorsScheme {
  Brightness get brightness;
  MaterialPrimaryColor get materialPrimaryColor;
  MaterialTextColor get textColor;
  Color get primaryColor => blueColor;
  Color get beigeColor => Color(0xFFE5CAA4);
  Color get darkBeigeColor => Color(0xFFB99E78);
  Color get blackColor => Color(0xFF000000);
  Color get blueColor => Color(0xFF0D2647);
  Color get greenColor => Color(0xFF60D669);
  Color get greyColor => Color(0xFF868686);
  Color get lightGreyColor => Color(0xFF9A9A9A);
  Color get blueGreyColor => Color(0xFF78899F);
  Color get brownColor => Color(0xFF8B6B3E);
  Color get lightBrownColor => Color(0xFFAC8A5B);
  Color get lightBlueColor => Color(0xFFD9D9D9);
  Color get offWhiteColor => Color(0xFF0D2647);
  Color get lightRedColor => Color(0xFFFFC3C3);
  Color get redColor => Color(0xFFFF543E);
  Color get scaffoldBackgroundColor => Color(0xFFF7EEDC);
  Color get secodanryColor => lightBlueColor;
  Color get whiteColor => Color(0xFFFFFFFF);
  Color get transparent => Color(0x00FFFFFF);

  Gradient loginGradient = LinearGradient(
    colors: [Color(0xFFF7EEDC), Color(0xFFFFFFFF)],
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
  );
  Gradient teachersGradient = LinearGradient(
    colors: [Color(0x00ffe6c2), Color(0xFF8B6B3E)],
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
  );
}
