import 'dart:async';

import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/login_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/otp_text_field.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  static const String path = '/signup_verification_screen';
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  Timer? _resendTimer;
  int _resendSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
    _startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startResendTimer() {
    _resendSeconds = 60;
    _canResend = false;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _submitOtp() {
    final code = controllers.map((controller) => controller.text).join();
    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 6-digit code')),
      );
      return;
    }

    context.read<SignupVerificationBloc>().add(
      CodeSubmittedEvent(code: code, email: widget.email),
    );
  }

  void _resendOtp() {
    if (!_canResend) return;
    context.read<SignupVerificationBloc>().add(
      ResendOtpPressedEvent(email: widget.email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.verification),
      body: BlocListener<SignupVerificationBloc, SignupVerificationState>(
        listener: (context, state) {
          if (state is CodeVerifiedSuccessfullyState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.translations.codeVerifiedSuccessfully),
              ),
            );
            context.go(LoginScreen.path);
          }

          if (state is ErrorVerifyingCodeState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }

          if (state is ResendSuccessState) {
            _startResendTimer();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is ResendErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                context.translations.enterCode,
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) {
                  return OtpTextField(
                    controller: controllers[i],
                    focusNode: focusNodes[i],
                    previosController: i != 0 ? controllers[i - 1] : null,
                    index: i,
                    onSubmit: _submitOtp,
                  );
                }),
              ),
              SizedBox(height: 20.h),
              Wrap(
                children: [
                  Text(
                    context.translations.verificationValidationTime,
                    style: TextStyle(
                      color: context.colorScheme.blueColor,
                        fontSize: 14.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: _canResend ? _resendOtp : null,
                    child: Text(
                      _canResend
                          ? context.translations.resend
                          : context.translations.nSeconds(_resendSeconds),
                      style: TextStyle(
                        color: _canResend
                            ? context.colorScheme.blueColor
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              BlocBuilder<SignupVerificationBloc, SignupVerificationState>(
                builder: (context, state) {
                  final isLoading =
                      state is VerifyingState || state is ResendLoadingState;
                  return CustomButton(
                    title: context.translations.send,
                    loading: isLoading,
                    onPressed: isLoading ? null : _submitOtp,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
