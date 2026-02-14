import 'package:doublem/core/enums/types/form_field_type_enum.dart';
import 'package:doublem/core/enums/types/validation_type_enum.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/helpers/validation_helper.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/utils/presentation_utils/loader_widget_mixin.dart';
import 'package:doublem/core/utils/presentation_utils/loading_mixin.dart';
import 'package:doublem/features/authentication/data/models/requests_body_model/login_request_body.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_event.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_state.dart';
import 'package:doublem/features/authentication/presentation/controllers/password_cubit/show_password_cubit.dart';
import 'package:doublem/features/authentication/presentation/controllers/remember_me_cubit/remember_me_cubit.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/custom_form_field.dart';
import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with ScreenLoadingUtils<LoginScreen>, ScreenLoader<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _formKey.currentState?.dispose;
    super.dispose();
  }

  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthenticationBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            startLoading();

            print('Loading');
          }

          if (state is Authenticated) {
            stopLoading();

            context.go(HomeScreen.path);
          }

          if (state is AuthError) {
            stopLoading();
            showError(customMessage: state.failure.errorMessage);
          }
        },
        child: Container(
          // height: 852.h,
          padding: EdgeInsets.symmetric(horizontal: (24.5).w),

          decoration: BoxDecoration(
            gradient: context.colorScheme.loginGradient,
          ),
          child: ListView(
            padding: EdgeInsets.only(bottom: 30.h),
            children: [
              SizedBox(height: 79.h),

              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    image: Assets.images.loginBackground.provider(),
                  ),
                  shape: BoxShape.rectangle,
                ),
                width: 312.w,
                child: Column(
                  children: [
                    SizedBox(height: 146.h),
                    Assets.images.loginLogo.image(height: 60.h, width: 60.w),
                    SizedBox(height: 10.h),
                    Text(
                      context.translations.welcomeBack,
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      context.translations.login,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 49.h),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SigningFormField(
                      // formKey: _formKey,
                      focusNode: _emailFocusNode,
                      hint: context.translations.email,
                      controller: _emailController,
                      onEditingComplete: () {
                        _emailFocusNode.nextFocus();
                      },
                      validator: (String? text) => ValidationHelper.validator(
                        context: context,
                        text: text,
                        validationType: ValidationType.email,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    BlocProvider(
                      create: (context) => getIt<ShowPasswordCubit>(),
                      child: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
                        builder: (context, state) {
                          return SigningFormField(
                            obscureText: !(context
                                .read<ShowPasswordCubit>()
                                .showPassword),
                            onPressed: () {
                              context
                                  .read<ShowPasswordCubit>()
                                  .showOrHidePassword();
                            },
                            formFieldType: FormFieldType.password,
                            focusNode: _passwordFocusNode,
                            hint: context.translations.password,
                            controller: _passwordController,
                            onEditingComplete: () {
                              _passwordFocusNode.unfocus();
                              //TODO
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
                  ],
                ),
              ),

              SizedBox(height: 11.h),

              SizedBox(
                height: 20.h,
                child: Row(
                  children: [
                    BlocProvider(
                      create: (context) => getIt<RememberMeCubit>(),
                      child: BlocBuilder<RememberMeCubit, RememberMeState>(
                        builder: (context, state) {
                          return Checkbox(
                            value: getIt<RememberMeCubit>().rememberMe,
                            onChanged: (value) {
                              getIt<RememberMeCubit>().changeRememberMe();
                            },
                          );
                        },
                      ),
                    ),
                    Text(
                      context.translations.rememberMe,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.h),

              CustomButton(
                title: context.translations.login,
                onPressed: () {
                  // context.read<AuthenticationBloc>().add(
                  //   LoginRequested(
                  //     LoginRequestBody(
                  //       email: _emailController.text,
                  //       password: _passwordController.text,
                  //     ),
                  //   ),
                  // );
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthenticationBloc>().add(
                      LoginRequested(
                        LoginRequestBody(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      ),
                    );
                    // context.push(HomeScreen.path);
                  }
                },
              ),

              SizedBox(height: 11.h),

              // Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         context.push(ForgotPasswordScreen.path);
              //       },
              //       child: Text(
              //         context.translations.forgotPassword,
              //         style: context.textTheme.bodySmall,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 162.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translations.dontHaveAccount,
                    style: context.textTheme.labelSmall,
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      context.push(SignupScreen.path);
                    },
                    child: Text(
                      context.translations.createAccount,
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
