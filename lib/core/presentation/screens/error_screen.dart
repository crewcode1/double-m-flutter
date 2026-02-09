// import 'package:doublem/core/common/presentation/widgets/custom_spacer.dart';
// import 'package:doublem/core/common/presentation/widgets/radial_container.dart';
// import 'package:doublem/core/constants/images.dart';
// import 'package:doublem/core/utils/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ErrorScreen extends StatelessWidget {
//   final void Function()? onTap;
//   final String? title;
//   const ErrorScreen({super.key, this.onTap, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.symmetric(vertical: 20.h),
//               child: Image.asset(ImageConstants.error, height: 300.h),
//             ),
//             const CustomSpacer(),
//             Text(
//               'errorScreenHeader'.tr(context),
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             CustomSpacer(space: 15.h),
//             Text(
//               'errorScreenBody'.tr(context),
//               style: Theme.of(context).textTheme.bodyLarge,
//               textAlign: TextAlign.center,
//             ),
//             const CustomSpacer(space: 40),
//             RadialContainer(title: title ?? 'back', onTap: onTap),
//           ],
//         ),
//       ),
//     );
//   }
// }
