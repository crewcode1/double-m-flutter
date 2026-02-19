import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/localization/cubit/localization_cubit.dart';
import 'package:doublem/features/settings/presentation/ui/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaclizationSettingTile extends StatelessWidget {
  const LoaclizationSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      color: context.colorScheme.lightBlueColor,
      title: context.translations.language,
      trailing: PopupMenuButton(
        icon: Icon(Icons.language),
        borderRadius: BorderRadius.circular(25.r),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(context.translations.english),
            onTap: () {
              context.read<LocalizationCubit>().changeLanguageToEnglish();
            },
          ),
          PopupMenuItem(
            child: Text(context.translations.arabic),
            onTap: () {
              context.read<LocalizationCubit>().changeLanguageToArabic();
            },
          ),
        ],
      ),
      titleColor: context.colorScheme.blueColor,
      onTap: () {},
    );
  }
}
