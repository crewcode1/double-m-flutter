import 'dart:io';

import 'package:doublem/core/enums/types/form_field_type_enum.dart';
import 'package:doublem/core/enums/types/validation_type_enum.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/helpers/validation_helper.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/features/login/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/verification_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/pick_image_widget.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/sign_up_form_field_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  static const String path = '/signup_screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late GlobalKey<FormState> _formKey;

  File? profileImage;

  /// Pick Image
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  /// Snackbar errors
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  /// _Phone validation
  bool isValidPhone(String phone) {
    return RegExp(r'^[0-9]+$').hasMatch(phone);
  }

  @override
  initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: context.translations.signUp),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 51.h),

              /// Profile image
              PickImageWidget(profileImage: profileImage, pickImage: pickImage),

              SizedBox(height: 37.h),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 18.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignUpFormFieldWithLabel(
                      label: context.translations.firstName,
                      controller: _firstName,
                      focusNode: _firstNameFocusNode,
                      hint: context.translations.firstName,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        _lastNameFocusNode.requestFocus();
                      },
                      validator: (String? text) => ValidationHelper.validator(
                        context: context,
                        text: text,
                        validationType: ValidationType.firstName,
                      ),
                    ),
                    SignUpFormFieldWithLabel(
                      label: context.translations.lastName,
                      controller: _lastName,
                      focusNode: _lastNameFocusNode,
                      hint: context.translations.lastName,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        _emailFocusNode.requestFocus();
                      },
                      validator: (String? text) => ValidationHelper.validator(
                        context: context,
                        text: text,
                        validationType: ValidationType.lastName,
                      ),
                    ),
                    SignUpFormFieldWithLabel(
                      label: context.translations.email,
                      controller: _email,
                      focusNode: _emailFocusNode,
                      hint: context.translations.email,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        _emailFocusNode.requestFocus();
                      },
                      validator: (String? text) => ValidationHelper.validator(
                        context: context,
                        text: text,
                        validationType: ValidationType.email,
                      ),
                    ),
                    SignUpFormFieldWithLabel(
                      label: context.translations.phone,
                      controller: _phone,
                      focusNode: _phoneFocusNode,
                      hint: context.translations.phone,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        _emailFocusNode.requestFocus();
                      },
                      validator: (String? text) => ValidationHelper.validator(
                        context: context,
                        text: text,
                        validationType: ValidationType.phone,
                      ),
                    ),
                    BlocProvider(
                      create: (context) => getIt<ShowPasswordCubit>(),
                      child: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
                        builder: (context, state) {
                          return SignUpFormFieldWithLabel(
                            label: context.translations.password,
                            controller: _password,
                            focusNode: _passwordFocusNode,
                            hint: context.translations.password,
                            keyboardType: TextInputType.text,
                            formFieldType: FormFieldType.password,
                            obscureText:
                                !(getIt<ShowPasswordCubit>().showPassword),
                            onPressed: () {
                              getIt<ShowPasswordCubit>().showOrHidePassword();
                            },
                            onEditingComplete: () {
                              _emailFocusNode.requestFocus();
                            },
                            validator: (String? text) =>
                                ValidationHelper.validator(
                                  context: context,
                                  text: text,
                                  validationType: ValidationType.password,
                                ),
                          );
                        },
                      ),
                    ),
                    BlocProvider(
                      create: (context) => getIt<ShowPasswordCubit>(),
                      child: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
                        builder: (context, state) {
                          return SignUpFormFieldWithLabel(
                            label: context.translations.confirmPassword,
                            controller: _confirmPassword,
                            focusNode: _confirmPasswordFocusNode,
                            hint: context.translations.confirmPassword,
                            keyboardType: TextInputType.text,
                            formFieldType: FormFieldType.password,
                            obscureText:
                                !(getIt<ShowPasswordCubit>().showPassword),
                            onPressed: () {
                              getIt<ShowPasswordCubit>().showOrHidePassword();
                            },
                            onEditingComplete: () {
                              _emailFocusNode.requestFocus();
                            },
                            validator: (String? text) =>
                                ValidationHelper.validator(
                                  context: context,
                                  text: text,
                                  validationType:
                                      ValidationType.confirmPassword,
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),

              // ================= FIELDS =================

              // ================= BUTTON =================
              CustomButton(
                title: context.translations.signUp,
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  context.push(VerificationScreen.path, extra: _email.text);
                  // }

                  /// ========== VALIDATIONS ==========

                  // if (_firstName.text.isEmpty ||
                  //     _lastName.text.isEmpty ||
                  //     _email.text.isEmpty ||
                  //     _phone.text.isEmpty ||
                  //     password.text.isEmpty ||
                  //     confirmPassword.text.isEmpty) {
                  //   showError("Please complete all fields");
                  //   return;
                  // }

                  // if (!_email.text.contains("@") || !_email.text.contains(".")) {
                  //   showError("Please enter a valid _email address");
                  //   return;
                  // }

                  // if (!isValid_Phone(_phone.text)) {
                  //   showError("_Phone number must contain only numbers");
                  //   return;
                  // }

                  // if (_phone.text.length < 10) {
                  //   showError("_Phone number is too short");
                  //   return;
                  // }

                  // if (password.text != confirmPassword.text) {
                  //   showError("Passwords do not match");
                  //   return;
                  // }

                  // if (profileImage == null) {
                  //   showError("Please choose a profile image");
                  //   return;
                  // }

                  /// ========== SAVE TO BLOC ==========
                  // context.read<ProfileBloc>().add(
                  //   LoadProfile(
                  //     _firstName.text,
                  //     _lastName.text,
                  //     _email.text,
                  //     _phone.text,
                  //     profileImage,
                  //   ),
                  // );

                  /// ========== NEXT PAGE ==========
                },
              ),

              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
