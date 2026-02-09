import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool? loading;
  final Color? color;
  final void Function()? onPressed;
  final double? fontSize;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.loading,
    this.height,
    this.width,
    this.fontSize,
    this.color,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding,
        width: (width ?? 344).w,
        height: (height ?? 50).h,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.blueColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: loading == true
              ? CircularProgressIndicator.adaptive(backgroundColor: color)
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
        ),
      ),
    );
  }
}
