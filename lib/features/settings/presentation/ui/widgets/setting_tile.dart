import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final Color titleColor;
  final String title;
  final Widget trailing;
  const SettingTile({
    super.key,
    this.onTap,
    required this.color,
    required this.title,
    required this.trailing,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: ListTile(
        title: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(color: titleColor),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
