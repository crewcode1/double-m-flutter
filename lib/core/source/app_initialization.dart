import 'package:doublem/core/utils/implementation/app_bloc_observer.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doublem/firebase_options.dart';

Future<void> appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheUtils.initCache();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: AppColors.transparent, // شريط التنقل السفلي
  //     statusBarColor: AppColors.transparent, // شريط الحالة العلوي
  //   ),
  // );
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  initGetIt();
  // FirebaseMessaging.onBackgroundMessage(
  //   NotificationsHelper.firebaseMessagingBackgroundHandler,
  // );
  Bloc.observer = DoubleMBlocObserver();
}
