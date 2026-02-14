import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class TeacherDetailValueCard extends StatelessWidget {
  final Color cardColor;
  final Color detailColor;
  final String detailTitle;
  final String valueTitle;
  final Color valueColor;
  const TeacherDetailValueCard({
    super.key,
    required this.cardColor,
    required this.detailColor,
    required this.valueColor,
    required this.detailTitle,
    required this.valueTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      height: 20.h,
      width: 186.w,
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detailTitle,
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              color: detailColor,
            ),
          ),
          Text(
            valueTitle,
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
