import 'dart:math';

import 'package:doublem/core/utils/implementation/cache_utils.dart';
// import 'package:firebase_installations/firebase_installations.dart';

class DeviceIDService {
  static Future<void> fetchToken() async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    if (deviceToken == null) {
      // deviceId = CacheUtils().getString(key: 'userToken');
      // deviceId = await FirebaseInstallations.id;
      _generateDeviceID();
    } else {}
    print('device_id : $deviceToken');
  }

  static void _generateDeviceID() {
    final Random random = Random.secure();
    final List<int> values = List<int>.generate(
      16,
      (index) => random.nextInt(256),
    );
    final String deviceId = values
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
    CacheUtils().setString(key: 'deviceToken', value: deviceId);
  }
}
