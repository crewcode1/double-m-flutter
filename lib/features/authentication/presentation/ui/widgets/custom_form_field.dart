import 'package:doublem/core/enums/types/form_field_type_enum.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/features/login/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:flutter/material.dart';

class SigningFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final FocusNode focusNode;
  // final GlobalKey<FormState>? formKey;
  final FormFieldType? formFieldType;
  final bool? enable;
  final bool? obscureText;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  const SigningFormField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.formFieldType,
    this.enable,
    this.onPressed,
    required this.focusNode,
    this.textInputAction,
    this.initialValue,
    this.obscureText,
    this.onEditingComplete,
    this.validator,
    // this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      validator: validator,
      // key: formKey,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),

        /// ********** EYE ICON **********
        suffixIcon: formFieldType == FormFieldType.password
            ? IconButton(
                icon: Icon(
                  getIt<ShowPasswordCubit>().showPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: onPressed,
              )
            : null,
      ),
    );
  }
}
