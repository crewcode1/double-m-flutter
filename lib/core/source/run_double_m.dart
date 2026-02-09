import 'package:doublem/core/constants_strings/keys_strings.dart';
import 'package:doublem/core/source/app_initialization.dart';
import 'package:doublem/core/source/run_updated_version_app.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void runDoubleM() async {
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = AppConstantsKeys.sentryID;
        options.sendDefaultPii = true;
      },
      appRunner: () async {
        await appInitialization();
        runUpdatedVersionApp();
      },
    );
  } else {
    await appInitialization();
    runUpdatedVersionApp();
  }
}
