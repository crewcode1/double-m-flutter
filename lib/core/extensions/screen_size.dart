import 'package:doublem/core/utils/implementation/screen_util.dart';

extension ScreenSize on num {
  double get w => this * ScreenUtilInit.screenWidth;
  double get h => this * ScreenUtilInit.screenHeight;
  double get sp => this * ScreenUtilInit.textSize;
  double get r => this * ScreenUtilInit.radius;
}
