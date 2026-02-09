import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  const RoundedButton({
    super.key,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.onTap,
    required this.title,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(25.r),
          color: color ?? context.colorScheme.primaryColor,
          border: Border.all(
            width: 1.r,
            color: context.colorScheme.primaryColor,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color:
                textColor ??
                (color != null
                    ? context.colorScheme.whiteColor
                    : context.colorScheme.whiteColor),
          ),
        ),
      ),
    );
  }
}
