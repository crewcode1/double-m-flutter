import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/utils/presentation_utils/alert_dialog.dart';
import 'package:doublem/features/profile/presentation/ui/screens/profile_screen.dart';
import 'package:doublem/features/settings/presentation/ui/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  static final String path = '/main_screen/settings_screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.settings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 14.h,
          children: [
            SettingTile(
              onTap: () {
                context.push(ProfileScreen.path);
              },
              color: context.colorScheme.lightBlueColor,
              title: context.translations.profile,
              trailing: Icon(Icons.arrow_forward_ios),
              titleColor: context.colorScheme.blueColor,
            ),
            SettingTile(
              color: context.colorScheme.lightBlueColor,
              title: context.translations.language,
              trailing: Text(context.translations.english),
              titleColor: context.colorScheme.blueColor,
            ),
            SettingTile(
              color: context.colorScheme.lightBlueColor,
              title: context.translations.theme,
              trailing: Text(context.translations.lightTheme),
              titleColor: context.colorScheme.blueColor,
            ),
            SettingTile(
              onTap: () {
                showAlertDialog(
                  context,
                  message: context.translations.areYouSureYouWantToLogout,
                );
              },
              color: context.colorScheme.lightRedColor,
              title: context.translations.logout,
              trailing: Icon(
                Icons.logout_outlined,
                color: context.colorScheme.redColor,
              ),
              titleColor: context.colorScheme.redColor,
            ),
            SettingTile(
              onTap: () {
                showAlertDialog(
                  context,
                  message:
                      context.translations.areYouSureYouWantToDeleteYourAccount,
                );
              },
              color: context.colorScheme.lightRedColor,
              title: context.translations.deleteAccount,
              trailing: Icon(
                Icons.delete_forever,
                color: context.colorScheme.redColor,
              ),
              titleColor: context.colorScheme.redColor,
            ),
          ],
        ),
      ),
    );
  }
}
