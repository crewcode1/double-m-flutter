import 'package:flutter/material.dart';

class ScreenUtilInit extends StatefulWidget {
  final Widget child;
  static late double screenWidth;
  static late double screenHeight;
  static late double textSize;
  static late double radius;
  const ScreenUtilInit({
    super.key,
    required this.child,
  });

  @override
  State<ScreenUtilInit> createState() => _ScreenUtilInitState();
}

class _ScreenUtilInitState extends State<ScreenUtilInit>
    with WidgetsBindingObserver {
  late Size designSize;
  static late double mediaQueryWidth;
  static late double mediaQueryHeight;

  void _setUpDesignSize(double width) {
    if (width < 600) {
      designSize = const Size(393, 852);
    } else if (width > 600 && width < 1024) {
      designSize = const Size(768, 1024);
    } else {
      designSize = const Size(1440, 905);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    mediaQueryWidth = mediaQuery.size.width;
    mediaQueryHeight = mediaQuery.size.height;
    _setUpDesignSize(mediaQueryWidth);

    /// نسبة العرض
    ScreenUtilInit.screenWidth = mediaQueryWidth / designSize.width;

    /// نسبة الارتفاع
    ScreenUtilInit.screenHeight = mediaQueryHeight / designSize.height;

    /// نختار المتوسط بينهم للـ radius عشان يطلع متوازن
    ScreenUtilInit.radius =
        (ScreenUtilInit.screenWidth + ScreenUtilInit.screenHeight) / 2;
    ScreenUtilInit.textSize = mediaQuery.textScaler.scale(1.0);
    return widget.child;
  }
}
