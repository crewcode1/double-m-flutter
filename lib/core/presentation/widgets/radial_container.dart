import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';

import 'package:flutter/material.dart';

class RadialContainer extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const RadialContainer({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(50.r),
            bottomEnd: Radius.circular(50.r),
          ),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            context.translations.welcome,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
