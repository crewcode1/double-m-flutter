import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doublem/core/env/env.dart';
import 'package:doublem/core/models/app_version_model/app_version_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();

  factory RemoteConfigService() => _instance;
  late bool _needsUpdate = false;
  bool get needsUpdate => _needsUpdate;

  RemoteConfigService._internal();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setDefaults({
      'current_app_versions': jsonEncode({
        "android": {"version": "1.0.0", "buildNumber": 1},
        "ios": {"version": "1.0.0", "buildNumber": 1},
      }),
      'base_url': Env.baseUrl,
    });
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 1),
      ),
    );

    await _remoteConfig.fetchAndActivate();
    _needsUpdate = await isAppVersionValid();
  }

  Future<bool> isAppVersionValid() async {
    late final AppVersionModel appVersionModel;
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // إعداد القيم الافتراضية
    // await _remoteConfig.setDefaults({
    //   'current_app_versions': jsonEncode({
    //     "android": {"version": "1.0.0", "buildNumber": 1},
    //     "ios": {"version": "1.0.0", "buildNumber": 1},
    //   }),
    // });

    // جلب البيانات من الريموت

    final remoteCurrentAppVersions = _remoteConfig.getString(
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

  String get dynamicBaseUrl => _remoteConfig.getString('base_url');
  bool get isMaintenance => _remoteConfig.getBool('maintenance');
}
