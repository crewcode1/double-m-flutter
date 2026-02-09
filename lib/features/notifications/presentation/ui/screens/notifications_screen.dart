import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/notifications/presentation/ui/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotificationsScreen extends StatelessWidget {
  static final String path = '/notifications_screen';
  const NotificationsScreen({super.key});
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: context.translations.notifications),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: (26.5).w),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 10,
        itemBuilder: (context, index) => NotificationTile(
          title: "Chemistry",
          description: "A new video has been added to the course. ",
          time: '1 hour ago',
        ),
      ),
    );
  }
}
