import 'package:doublem/core/enums/responsive/responsive_enum.dart';
import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  ResponsiveUI get responsiveUI {
    if ((MediaQuery.sizeOf(this).height < 100)) {
      return ResponsiveUI.abnormal;
    } else {
      if (MediaQuery.sizeOf(this).width > 1024) {
        return ResponsiveUI.web;
      } else if (MediaQuery.sizeOf(this).width > 600 &&
          MediaQuery.sizeOf(this).width < 1024) {
        return ResponsiveUI.tablet;
      } else {
        return ResponsiveUI.mobile;
      }
    }
  }
}
