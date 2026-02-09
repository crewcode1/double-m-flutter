import 'package:doublem/core/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actionsList;
  final String title;
  const CustomAppBar({super.key, this.actionsList, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: actionsList);
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
