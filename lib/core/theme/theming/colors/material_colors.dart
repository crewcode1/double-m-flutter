import 'package:doublem/core/enums/themes/material_colors_enum.dart';
import 'package:flutter/material.dart';

class MaterialPrimaryColor extends ColorSwatch<PrimaryColor> {
  const MaterialPrimaryColor(super.primary, super.swatch);

  Color get tint => this[PrimaryColor.tint] ?? _transparentColor;

  Color get _transparentColor => Colors.transparent;
}

class MaterialTextColor extends ColorSwatch<TextColor> {
  const MaterialTextColor(super.primary, super.swatch);
  Color get black => this[TextColor.black]!;
  Color get secondary => this[TextColor.secondary]!;
  Color get grey => this[TextColor.grey]!;
  Color get darkGrey => this[TextColor.darkGrey]!;
  Color get white => this[TextColor.white]!;
  Color get lightGrey => this[TextColor.lightGrey]!;
}
