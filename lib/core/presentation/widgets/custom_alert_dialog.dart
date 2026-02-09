import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/rounded_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? yesColor;
  final Color? noColor;
  final String message;
  final String? yesTitle;
  final String? noTitle;
  final Widget? content;
  final void Function()? onYesFunction;
  final void Function()? onNoFunction;
  const CustomAlertDialog({
    super.key,
    required this.message,
    this.yesTitle,
    this.noTitle,
    this.onYesFunction,
    this.onNoFunction,
    this.content,
    this.yesColor,
    this.noColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      iconPadding: EdgeInsetsDirectional.only(
        end: 15.w,
        top: 10.h,
        bottom: 10.h,
      ),
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.cancel_outlined),
          ),
        ],
      ),
      content: content,
      iconColor: context.colorScheme.primaryColor,
      alignment: AlignmentDirectional.center,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        RoundedButton(
          width: 90.w,
          height: 28.h,
          title: yesTitle ?? context.translations.yes,
          onTap: onYesFunction,
          color: yesColor ?? context.colorScheme.primaryColor,
        ),
        RoundedButton(
          width: 90.w,
          height: 28.h,
          color: noColor ?? context.colorScheme.greyColor,
          title: noTitle ?? context.translations.no,
          onTap: onNoFunction,
        ),
      ],
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
