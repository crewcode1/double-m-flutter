import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:flutter/material.dart';

mixin ScreenLoadingUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? handleError({
    Failure? failure,
    String? customMessage,
    // Map<ServerErrorCode, String>? customMessages,
    bool isFloating = false,
  }) {
    return showError(
      failure: failure,
      customMessage: customMessage,
      // customMessages: customMessages,
      isFloating: isFloating,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError({
    Failure? failure,
    String? customMessage,
    // Map<ServerErrorCode, String>? customMessages,
    bool isFloating = false,
  }) {
    final tr = (context).translations;
    String message = customMessage ?? tr.rememberMe;
    // if (failure != null) {
    //   if (failure is NetworkFailureModel) {
    //     if (failure.errorCode == ServerErrorCode.forbidden ||
    //         failure.errorCode == ServerErrorCode.accessDenied) {
    //       message = tr.accessDeniedMessage;
    //     } else if (failure.errorCode == ServerErrorCode.unauthenticated) {
    //       message = tr.unauthenticatedMessage;
    //     } else if ((customMessages?.isNotEmpty ?? false) &&
    //         customMessages?[failure.errorCode] != null) {
    //       message = customMessages![failure.errorCode] ?? tr.errorMessage;
    //     } else if (failure.message.isNotEmpty) {
    //       message = failure.message;
    //     }
    //   } else if (failure is NetworkFailure) {
    //     message = (failure.connectionTimeOut)
    //         ? context.translation.connectionTimeOut
    //         : context.translation.noInternetConnection;
    //   }
    // }

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: context.colorScheme.whiteColor),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.whiteColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.colorScheme.redColor,
        behavior: isFloating ? SnackBarBehavior.floating : null,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess({
    String? customMessage,
    bool isFloating = false,
  }) {
    final tr = context.translations;
    String message = customMessage ?? tr.students;

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,

          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.whiteColor,
          ),
        ),
        backgroundColor: context.colorScheme.greenColor,
        behavior: isFloating ? SnackBarBehavior.floating : null,
      ),
    );
  }
}
