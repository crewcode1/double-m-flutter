import 'dart:io';
import 'package:doublem/core/constants_strings/keys_strings.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/presentation/widgets/radial_container.dart';
import 'package:doublem/core/utils/implementation/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});
  String _redirectToStore() {
    if (Platform.isAndroid) {
      return AppConstantsKeys.googlePlayLink;
    } else if (Platform.isIOS) {
      return AppConstantsKeys.appStoreLink;
    }
    return AppConstantsKeys.googlePlayLink;
  }

  void _launchStore() async {
    late final Uri url = Uri.parse(_redirectToStore());
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(home: ForceUpdateWidget(onPressed: _launchStore)),
    );
  }
}

class ForceUpdateWidget extends StatelessWidget {
  final void Function()? onPressed;
  const ForceUpdateWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "newVersionAvailable",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text("updateAppMessage", textAlign: TextAlign.center),
              SizedBox(height: 24.h),
              RadialContainer(onTap: onPressed, title: "updateNow"),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:doublem/core/constants_strings/constant_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ForceUpdateScreen extends StatelessWidget {
//   const ForceUpdateScreen({super.key});
//   String _redirectToStore() {
//     if (Platform.isAndroid) {
//       return AppConstantsKeys.googlePlayLink;
//     } else if (Platform.isIOS) {
//       return AppConstantsKeys.appStoreLink;
//     }
//     return AppConstantsKeys.googlePlayLink;
//   }

//   void _launchStore() async {
//     late final Uri url = Uri.parse(_redirectToStore());
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LocalizationCubit>(
//       create: (context) => getIt<LocalizationCubit>(),
//       child: BlocBuilder<LocalizationCubit, LocalizationState>(
//         builder: (localizationContext, localizationState) {
//           return ScreenUtilInit(
//             designSize: Size(393, 852),
//             child: MaterialApp(
//               title: 'NC Requests',
//               debugShowCheckedModeBanner: false,
//               supportedLocales: AppLocalization.supportedLocales,
//               localizationsDelegates: [
//                 AppLocalizationDelegate(),
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//               ],
//               locale: localizationState.locale,
//               home: ForceUpdateWidget(onPressed: _launchStore),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ForceUpdateWidget extends StatelessWidget {
//   final void Function()? onPressed;
//   const ForceUpdateWidget({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.onPrimary,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "newVersionAvailable",
//                 style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16.h),
//               Text("updateAppMessage", textAlign: TextAlign.center),
//               SizedBox(height: 24.h),
//               RadialContainer(onTap: onPressed, title: "updateNow"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
