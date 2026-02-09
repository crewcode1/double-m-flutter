import 'package:doublem/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

extension Translation on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
}
