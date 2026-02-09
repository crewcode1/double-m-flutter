// import 'package:doublem/core/common/presentation/widgets/custom_spacer.dart';
// import 'package:doublem/core/common/presentation/widgets/radial_container.dart';
// import 'package:doublem/core/constants/images.dart';
// import 'package:doublem/core/utils/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NoDataScreen extends StatelessWidget {
//   final String? title;
//   final bool? contineuButton;
//   final void Function()? onTap;

//   const NoDataScreen({super.key, this.onTap, this.title, this.contineuButton});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsetsDirectional.symmetric(vertical: 40.h),
//             child: Image.asset(ImageConstants.noData, height: 300.h),
//           ),
//           const CustomSpacer(),
//           Text(
//             'NoDataScreenHeader'.tr(context),
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           CustomSpacer(space: 15.h),
//           Text(
//             'NoDataScreenBody'.tr(context),
//             style: Theme.of(context).textTheme.bodyLarge,
//             textAlign: TextAlign.center,
//           ),
//           const CustomSpacer(space: 40),
//           if (contineuButton == true)
//             RadialContainer(
//               title: (title ?? 'continue').tr(context),
//               onTap: onTap,
//             ),
//         ],
//       ),
//     );
//   }
// }
