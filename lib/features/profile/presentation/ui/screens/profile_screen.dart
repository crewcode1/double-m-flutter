import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_event.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_state.dart';
import 'package:doublem/features/profile/presentation/ui/widgets/profile_detail_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static final String path = '/profile_screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {}
  }

  @override
  void initState() {
    super.initState();

    context.read<AuthenticationBloc>().add(LoadProfileRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: context.translations.profile),
      body: BlocBuilder<AuthenticationBloc, AuthState>(
        builder: (context, state) {
          return BlocBuilder<AuthenticationBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingProfile) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (state is ProfileLoaded) {
                print(state.user.email.toString());
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      spacing: 18.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 51.h),

                        /// Profile image
                        // PickImageWidget(
                        //   profileImage: File(ProfileScreen.path),
                        //   pickImage: pickImage,
                        // ),
                        // SizedBox(height: 37.h),
                        ProfileDetailWithLabel(
                          label: context.translations.fullName,
                          hint: context.translations.firstName,
                          value: state.user.fullName,
                        ),

                        ProfileDetailWithLabel(
                          label: context.translations.email,
                          hint: context.translations.email,
                          value: state.user.email,
                        ),
                        ProfileDetailWithLabel(
                          label: context.translations.phone,
                          hint: context.translations.phone,
                          value: state.user.phoneNumber,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text(context.translations.failedToLoadData),
                );
              }
            },
          );
        },
      ),
    );
  }
}
