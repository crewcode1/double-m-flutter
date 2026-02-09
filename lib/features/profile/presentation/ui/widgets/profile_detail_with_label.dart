import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class ProfileDetailWithLabel extends StatelessWidget {
  final String label;

  final String hint;
  final String value;

  const ProfileDetailWithLabel({
    super.key,
    required this.label,

    required this.hint,

    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 11.h,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 12.w),
          child: Text(label, style: context.textTheme.bodyLarge),
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 19.w,
            vertical: 15.h,
          ),
          width: 344.w,
          decoration: BoxDecoration(
            color: context.colorScheme.lightBlueColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(value, style: context.textTheme.displayLarge),
        ),
      ],
    );
  }
}
