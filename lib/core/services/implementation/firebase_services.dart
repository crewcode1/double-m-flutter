import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:firebase_installations/firebase_installations.dart';

class DeviceIDService {
  static String? deviceId = 'device_id';

  static Future<void> fetchToken() async {
    String? deviceToken = CacheUtils().getString(key: 'deviceToken');

    if (deviceToken == null) {
      deviceId = await FirebaseInstallations.id;
      CacheUtils().setString(
        key: 'deviceToken',
        value: deviceId ?? 'device_id',
      );
    } else {}
    print('device_id : $deviceToken');
  }
}
