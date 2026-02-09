abstract class AbstractCacheUtils {
  Future<bool> setString({required String key, required String value});
  Future<bool> setInt({required String key, required int value});
  Future<bool> setBool({required String key, required bool value});
  String? getString({required String key});
  int? getInt({required String key});
  bool? getBool({required String key});
  Future<bool> remove({required String key});
  Future<bool> clear();
}
