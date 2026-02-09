import 'package:doublem/core/enums/types/alert_types.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    required AlertType type,
    double? height,
    double? width,
    String? title,
    bool? showCloseIcon,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((12.5).r),
          side: BorderSide(
            width: 1.sp,
            color: context.colorScheme.primaryColor,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsetsDirectional.only(
          bottom: 20.h,
          start: 15.w,
          end: 15.w,
        ),
        padding: EdgeInsetsDirectional.only(
          top: 5.h,
          bottom: 10.h,
          start: 10.w,
          end: 10.w,
        ),
        duration: duration ?? const Duration(seconds: 6),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10.w),
              child: Icon(
                type == AlertType.failed
                    ? Icons.error
                    : type == AlertType.success
                    ? Icons.check_circle
                    : Icons.warning,
              ),
            ),
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
                icon: const Icon(Icons.cancel),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  // static void showNotification(
  //   BuildContext context, {
  //   required void Function()? onTap,
  //   String? description,
  // }) {
  //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       dismissDirection: DismissDirection.startToEnd,
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12.5.r),
  //         side: BorderSide(width: 1.sp, color: context.colorScheme.primaryColor),
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       margin: EdgeInsetsDirectional.only(
  //         bottom: 735.h,
  //         start: 15.w,
  //         end: 15.w,
  //       ),
  //       padding: EdgeInsetsDirectional.only(
  //         top: 10.h,
  //         bottom: 10.h,
  //         start: 10.w,
  //         end: 10.w,
  //       ),
  //       duration: const Duration(seconds: 4),
  //       content: InkWell(
  //         onTap: onTap,
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   context,
  //                   overflow: TextOverflow.ellipsis,
  //                   textAlign: TextAlign.start,
  //                   style: Theme.of(context).textTheme.bodyMedium,
  //                 ),
  //               ],
  //             ),
  //             Row(children: [Assets.images.logo.image()]),
  //             Flexible(
  //               child: Text(
  //                 (description ?? 'youHaveNewNotification').tr(context),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //                 textAlign: TextAlign.start,
  //                 style: Theme.of(context).textTheme.bodyMedium,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       backgroundColor: Theme.of(context).colorScheme.surface,
  //     ),
  //   );
  // }
}
