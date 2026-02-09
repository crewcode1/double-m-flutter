import 'package:doublem/core/enums/types/form_field_type_enum.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/features/login/presentation/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFormFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final FormFieldType? formFieldType;
  final bool? enable;
  final bool? obscureText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function()? onPressed;
  const SignUpFormFieldWithLabel({
    super.key,
    required this.label,
    required this.focusNode,
    required this.controller,
    required this.hint,
    this.formFieldType,
    this.enable,
    this.obscureText,
    this.initialValue,
    required this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.onPressed,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 11.h,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 12.w),
          child: Text(label, style: context.textTheme.bodyLarge),
        ),
        SigningFormField(
          formFieldType: formFieldType,
          keyboardType: keyboardType,
          onEditingComplete: onEditingComplete,
          onPressed: onPressed,
          textInputAction: textInputAction,
          controller: controller,
          hint: hint,
          focusNode: focusNode,
          obscureText: obscureText,
          enable: enable,
          initialValue: initialValue,
          validator: validator,
        ),
      ],
    );
  }
}
