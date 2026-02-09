import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: 'configurations/.env',
  obfuscate: false,
) // obfuscate=true لحماية البيانات في الريليس
abstract class Env {
  @EnviedField(varName: 'SERVICE_KEY')
  static const String serviceKey = _Env.serviceKey;

  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'DOWNLOAD_BASE_URL')
  static const String downloadBaseUrl = _Env.downloadBaseUrl;

  @EnviedField(varName: 'SERVICE_ACCOUNT_KEY')
  static const String serviceAccountKey = _Env.serviceAccountKey;
}
