import 'dart:io';

import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/profile/presentation/ui/widgets/profile_detail_with_label.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  static final String path = '/profile_screen';
  const ProfileScreen({super.key});
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: context.translations.profile),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 51.h),

            /// Profile image
            PickImageWidget(profileImage: File(path), pickImage: pickImage),

            SizedBox(height: 37.h),
            Column(
              spacing: 18.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailWithLabel(
                  label: context.translations.firstName,
                  hint: context.translations.firstName,
                  value: context.translations.firstName,
                ),
                ProfileDetailWithLabel(
                  label: context.translations.lastName,
                  hint: context.translations.lastName,
                  value: context.translations.lastName,
                ),
                ProfileDetailWithLabel(
                  label: context.translations.email,
                  hint: context.translations.email,
                  value: context.translations.email,
                ),
                ProfileDetailWithLabel(
                  label: context.translations.phone,
                  hint: context.translations.phone,
                  value: context.translations.phone,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
