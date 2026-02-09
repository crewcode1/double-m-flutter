import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/services/implementation/local_authentication_services.dart';
import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  late LocalAuthenticationServices _localAuthenticationServices;

  void _performAuthentication() async {
    _localAuthenticationServices = LocalAuthenticationServices(
      authenticationReason: context.translations.welcome,
    );
    await _localAuthenticationServices.authenticate();

    if (_localAuthenticationServices.authenticated && mounted) {
      WidgetsBinding.instance.removeObserver(this); // 🔑 مهم
      context.goNamed(HomeScreen.path);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    _performAuthentication();
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      _performAuthentication();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
