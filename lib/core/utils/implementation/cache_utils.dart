import 'package:doublem/core/utils/absraction/abstract_cache_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils implements AbstractCacheUtils {
  static CacheUtils? _instance;
  static SharedPreferences? _preferences;
  CacheUtils._internal();
  factory CacheUtils() {
    if (_instance == null) {
      return CacheUtils._internal();
    } else {
      return _instance!;
    }
  }
  static Future<void> initCache() async {
    _preferences = await SharedPreferences.getInstance();

    if (_preferences?.getString('language') == null) {
      await _preferences?.setString('language', 'en');
      // locale = 'en';
    }
  }

  @override
  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  @override
  bool? getBool({required String key}) {
    if (_preferences == null) return null;
    return _preferences!.getBool(key);
  }
  // Retrieve an integer

  @override
  int? getInt({required String key}) {
    if (_preferences == null) return null;
    return _preferences!.getInt(key);
  }

  @override
  String? getString({required String key}) {
    {
      if (_preferences == null) return null;
      return _preferences!.getString(key);
    }
  }

  @override
  Future<bool> remove({required String key}) async {
    return await _preferences!.remove(key);
  }

  @override
  Future<bool> setBool({required String key, required bool value}) async {
    return await _preferences!.setBool(key, value);
  }
  // // Save an integer

  @override
  Future<bool> setInt({required String key, required int value}) async {
    return await _preferences!.setInt(key, value);
  }

  @override
  Future<bool> setString({required String key, required String value}) async {
    {
      return await _preferences!.setString(key, value);
    }
  }

  // // Save an integer
  // @override
  // Future<bool> setInt(String key, int value) async {
  //   return await _preferences!.setInt(key, value);
  // }

  // // Retrieve an integer
  // @override
  // int? getInt(String key) {
  //   if (_preferences == null) return null;
  //   return _preferences!.getInt(key);
  // }

  // // Save a boolean
  // @override
  // Future<bool> setBool(String key, bool value) async {
  //   return await _preferences!.setBool(key, value);
  // }

  // // Retrieve a boolean
  // @override
  // bool? getBool(String key) {
  //   if (_preferences == null) return null;
  //   return _preferences!.getBool(key);
  // }

  // // Remove a key
  // @override
  // Future<bool> remove(String key) async {
  //   return await _preferences!.remove(key);
  // }

  // // Clear all data
  // @override
  // Future<bool> clear() async {
  //   return await _preferences!.clear();
  // }
}
