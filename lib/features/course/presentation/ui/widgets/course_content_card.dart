import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class CourseContentCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CourseContentCard({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 135.h,
        decoration: BoxDecoration(
          color: context.colorScheme.lightBlueColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(child: Text(title, style: context.textTheme.bodyLarge)),
      ),
    );
  }
}
