import 'package:doublem/core/enums/themes/material_colors_enum.dart';
import 'package:doublem/core/theme/theming/colors/app_colors_scheme.dart';
import 'package:doublem/core/theme/theming/colors/material_colors.dart';
import 'package:flutter/material.dart';

class AppLightColorScheme extends AppColorsScheme {
  @override
  MaterialTextColor get textColor =>
      const MaterialTextColor(0xff000000, <TextColor, Color>{
        TextColor.secondary: Color(0xff588894),
        TextColor.white: Colors.white,
        TextColor.grey: Color(0xff9A9A9A),
        TextColor.black: Color(0xff000000),
      });

  @override
  MaterialPrimaryColor get materialPrimaryColor =>
      MaterialPrimaryColor(0xff25454D, <PrimaryColor, Color>{
        // ignore: deprecated_member_use
        PrimaryColor.tint: const Color(0xff25454D).withOpacity(0.1),
      });

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primaryColor => blueColor;

  @override
  Color get beigeColor => Color(0xFFE5CAA4);

  @override
  Color get blackColor => Color(0xFF000000);

  @override
  Color get blueColor => Color(0xFF0D2647);

  @override
  Color get greenColor => Color(0xFF60D669);

  @override
  Color get greyColor => Color(0xFF868686);

  @override
  Color get lightBrownColor => Color(0xFF8B6B3E);

  @override
  Color get lightBlueColor => Color(0xFFD9D9D9);

  @override
  Color get offWhiteColor => Color(0xFF0D2647);

  @override
  Color get redColor => Color(0xFFFF543E);

  @override
  Color get scaffoldBackgroundColor => Color(0xFFF7EEDC);

  @override
  Color get secodanryColor => lightBlueColor;

  @override
  Color get whiteColor => Color(0xFFFFFFFF);
}
