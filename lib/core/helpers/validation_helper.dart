import 'package:doublem/core/enums/types/validation_type_enum.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:flutter/material.dart';

class ValidationHelper {
  static final phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final textOnlyRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');

  static String? validator({
    required ValidationType validationType,
    required BuildContext context,
    required String? text,
  }) {
    if (text == null || text.isEmpty) {
      return context.translations.emptyField;
    } else {
      switch (validationType) {
        case ValidationType.email:
          if (!isValidEmail(text: text)) {
            return context.translations.invalidEmail;
          }
        case ValidationType.phone:
          if (!isValidPhoneNumber(text: text)) {
            return context.translations.invalidPhoneNumber;
          }
        case (ValidationType.firstName):
          if (!isValidName(text: text)) {
            return context.translations.invalidName;
          }
        case (ValidationType.lastName):
          if (!isValidName(text: text)) {
            return context.translations.invalidName;
          }

        default:
          return null;
      }
      return null;
    }
  }

  static bool isValidEmail({required String text}) {
    return emailRegex.hasMatch(text);
  }

  static bool isValidPhoneNumber({required String text}) {
    return phoneRegex.hasMatch(text);
  }

  static bool isValidName({required String text}) {
    return textOnlyRegex.hasMatch(text);
  }
}
