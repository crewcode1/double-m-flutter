import 'package:local_auth/local_auth.dart';

class LocalAuthenticationServices {
  final String authenticationReason;
  bool _authenticated = false;
  bool get authenticated => _authenticated;
  LocalAuthenticationServices({required this.authenticationReason});
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  Future<bool> authenticate() async {
    bool isDeviceSupported = false;
    bool canCheckBiometrics = false;
    List<BiometricType> avaliableBiometrics = [];

    isDeviceSupported = await _isDeviceSuppoted();
    if (isDeviceSupported) {
      canCheckBiometrics = await _canCheckBiometrics();
      if (canCheckBiometrics) {
        avaliableBiometrics = await _getAvaliableBiometrics();
        if (avaliableBiometrics.isNotEmpty) {
          _authenticated = await _localAuthentication.authenticate(
            localizedReason: authenticationReason,
          );
        }
      }
    }
    _localAuthentication.stopAuthentication();
    return _authenticated;
  }

  Future<bool> _isDeviceSuppoted() async {
    final bool isSupported = await _localAuthentication.isDeviceSupported();
    return isSupported;
  }

  Future<bool> _canCheckBiometrics() async {
    final bool canCheckBiometrics =
        await _localAuthentication.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<List<BiometricType>> _getAvaliableBiometrics() async {
    final List<BiometricType> avaliableBiometrics = await _localAuthentication
        .getAvailableBiometrics();
    return avaliableBiometrics;
  }
}
