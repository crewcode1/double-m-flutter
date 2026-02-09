import 'package:doublem/core/presentation/widgets/custom_alert_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required String message,
  String? yesTitle,
  String? noTitle,
  Widget? content,
  void Function()? onYesFunction,
  void Function()? onNoFunction,
}) {
  showDialog(
    context: context,
    builder: (BuildContext alertDialogcontext) {
      return CustomAlertDialog(
        content: content,
        message: message,
        yesTitle: yesTitle,
        noTitle: noTitle,
        onNoFunction:
            onNoFunction ??
            () {
              context.pop();
            },
        onYesFunction: onYesFunction,
      );
    },
  );
}
