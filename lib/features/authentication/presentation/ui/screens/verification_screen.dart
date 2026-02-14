import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/login_screen.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/otp_text_field.dart';
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
  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.verification),

      body: BlocListener<SignupVerificationBloc, SignupVerificationState>(
        listener: (context, state) {
          if (state is CodeVerifiedSuccessfullyState) {
            context.push(LoginScreen.path);
          }

          if (state is ErrorVerifyingCodeState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),

              Text(
                context.translations.enterCode,
                style: context.textTheme.bodyLarge,
              ),

              SizedBox(height: 25),

              /// 🔥 6 CODE BOXES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) {
                  return GestureDetector(
                    onTap: () {},
                    child: OtpTextField(
                      controller: controllers[i],
                      focusNode: focusNodes[i],
                      previosController: (i != 0) ? controllers[i - 1] : null,

                      // previousFocusNode: (i != 0) ? focusNodes[i - 1] : null,
                      // nextfocusNode: (i != 5) ? focusNodes[i + 1] : null,
                      index: i,
                      onSubmit: () {
                        print('A77eeeeehhh');
                      },
                    ),
                  );
                }),
              ),

              SizedBox(height: 20),

              //  Text(
              //   "Please note that the verification code is only valid for 60 seconds. rebroadcast?",
              //   style: TextStyle(fontSize: 12, height: 1.4, color: context.colorScheme.primaryColor,),
              //  ),
              Wrap(
                children: [
                  Text(
                    "Please note that the verification code is only valid for 60 seconds ",
                    style: TextStyle(color: Color(0xFF08263A), fontSize: 14),
                  ),
                  Text(
                    "reSend?",
                    style: TextStyle(
                      color: Color(0xFF08263A),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              /// 🔥 SEND BUTTON
              BlocBuilder<SignupVerificationBloc, SignupVerificationState>(
                builder: (context, state) {
                  if (state is VerifyingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return CustomButton(
                    title: "Send",
                    onPressed: () {
                      final code = controllers.map((c) => c.text).join();

                      /// شرط نجاح الكود (مثال: 6 أرقام لازم تكون متدخلة)
                      if (code.length != 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Enter a valid 6-digit code",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                        return;
                      }

                      // إرسال الكود للبلوك
                      getIt<SignupVerificationBloc>().add(
                        CodeSubmittedEvent(code: code),
                      );
                    },
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
