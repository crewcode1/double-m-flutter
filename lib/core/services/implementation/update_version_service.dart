import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doublem/core/models/app_version_model/app_version_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionService {
  static Future<bool> isAppVersionValid() async {
    late final AppVersionModel appVersionModel;
    final remoteConfig = FirebaseRemoteConfig.instance;
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // إعداد القيم الافتراضية
    await remoteConfig.setDefaults({
      'current_app_versions': jsonEncode({
        "android": {"version": "1.0.0", "buildNumber": 1},
        "ios": {"version": "1.0.0", "buildNumber": 1},
      }),
    });

    // جلب البيانات من الريموت
    await remoteConfig.fetchAndActivate();

    final remoteCurrentAppVersions = remoteConfig.getString(
      'current_app_versions',
    );
    log(remoteCurrentAppVersions);
    final Map<String, dynamic> currentAppVersions = jsonDecode(
      remoteCurrentAppVersions,
    );
    log(currentAppVersions.toString());

    if (Platform.isAndroid) {
      appVersionModel = AppVersionModel.fromJson(
        json: currentAppVersions,
        platform: 'android',
      );
    } else {
      appVersionModel = AppVersionModel.fromJson(
        json: currentAppVersions,
        platform: 'ios',
      );
    }
    final String currentVersion = packageInfo.version;
    final int currentBuildNumber = int.parse(packageInfo.buildNumber);
    log('Current Version: $currentVersion');
    log('Required Version: ${appVersionModel.version}');
    log('Current Build Number: $currentBuildNumber');
    log('Required Build Number: ${appVersionModel.buildNumber}');

    return (currentVersion == appVersionModel.version &&
        currentBuildNumber == appVersionModel.buildNumber);
  }
}
