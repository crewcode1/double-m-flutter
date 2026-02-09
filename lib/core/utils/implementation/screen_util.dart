// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScreenUtilInit extends StatelessWidget {
  final MaterialApp child;
  late Size designSize;
  static late double screenWidth;
  static late double screenHeight;
  static late double textSize;
  static late double radius;
  static late double mediaQueryWidth;
  static late double mediaQueryHeight;
  static late double mediaQuerytextSize;

  void _setUpDesignSize(double width) {
    if (width < 600) {
      designSize = const Size(393, 852);
    } else if (width > 600 && width < 1024) {
      designSize = const Size(768, 1024);
    } else {
      designSize = const Size(1440, 905);
    }
  }

  ScreenUtilInit({
    super.key,
    //  required this.designSize,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    mediaQueryWidth = mediaQuery.size.width;
    mediaQueryHeight = mediaQuery.size.height;
    _setUpDesignSize(mediaQueryWidth);

    /// نسبة العرض
    screenWidth = mediaQueryWidth / designSize.width;

    /// نسبة الارتفاع
    screenHeight = mediaQueryHeight / designSize.height;

    /// نختار المتوسط بينهم للـ radius عشان يطلع متوازن
    radius = (screenWidth + screenHeight) / 2;
    textSize = mediaQuery.textScaler.scale(1.0);
    return child;
  }
}
