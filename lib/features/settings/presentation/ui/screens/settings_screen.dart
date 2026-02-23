import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/utils/presentation_utils/alert_dialog.dart';
import 'package:doublem/core/utils/presentation_utils/loader_widget_mixin.dart';
import 'package:doublem/core/utils/presentation_utils/loading_mixin.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_event.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_state.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/login_screen.dart';
import 'package:doublem/features/profile/presentation/ui/screens/profile_screen.dart';
import 'package:doublem/features/settings/presentation/ui/widgets/localization_setting_tile.dart';
import 'package:doublem/features/settings/presentation/ui/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  static final String path = '/main_screen/settings_screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with ScreenLoadingUtils, ScreenLoader {
  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.settings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocListener<AuthenticationBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              startLoading();
            } else {
              stopLoading();

              if (state is Unauthenticated) {
                stopLoading();
                context.go(LoginScreen.path);
              }
            }
          },
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
              LoaclizationSettingTile(),
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
                    onYesFunction: () {
                      context.read<AuthenticationBloc>().add(LogoutRequested());
                      context.pop();
                    },
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
              // SettingTile(
              //   onTap: () {
              //     showAlertDialog(
              //       context,
              //       message:
              //           context.translations.areYouSureYouWantToDeleteYourAccount,
              //     );
              //   },
              //   color: context.colorScheme.lightRedColor,
              //   title: context.translations.deleteAccount,
              //   trailing: Icon(
              //     Icons.delete_forever,
              //     color: context.colorScheme.redColor,
              //   ),
              //   titleColor: context.colorScheme.redColor,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
