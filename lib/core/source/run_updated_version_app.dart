import 'package:doublem/core/presentation/screens/force_update_screen.dart';
import 'package:doublem/core/services/implementation/update_version_service.dart';
import 'package:flutter/material.dart';
import 'package:doublem/core/source/app.dart';

void runUpdatedVersionApp() async {
  bool isValid = true;
  try {
    isValid = await VersionService.isAppVersionValid();
  } catch (e) {
    debugPrint('error fetching app vresion $e');
  }
  runApp(isValid ? const DoubleM() : const ForceUpdateScreen());
}
