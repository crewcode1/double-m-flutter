import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;

  final String description;
  final String time;

  const NotificationTile({
    super.key,
    required this.title,

    required this.description,

    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 19.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.lightBlueColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 11.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // padding: EdgeInsetsDirectional.only(start: 12.w),
            children: [
              Text(
                title,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.blackColor,
                ),
              ),
              Text(
                time,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.greyColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  description,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.blueGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
