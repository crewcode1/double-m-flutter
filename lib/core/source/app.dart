import 'package:doublem/core/enums/themes/themes_enum.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/localization/app_localizations.dart';
import 'package:doublem/core/localization/cubit/localization_cubit.dart';
import 'package:doublem/core/routes/app_router.dart';
import 'package:doublem/core/theme/cubit/theming_cubit.dart';
import 'package:doublem/core/theme/theming/theme.dart';
import 'package:doublem/core/utils/implementation/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DoubleM extends StatelessWidget {
  const DoubleM({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemingCubit>(create: (context) => getIt<ThemingCubit>()),
        BlocProvider<LocalizationCubit>(
          create: (context) => getIt<LocalizationCubit>(),
        ),
      ],
      child: BlocBuilder<ThemingCubit, ThemingState>(
        builder: (context, themingState) {
          return BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, localizationState) {
              return ScreenUtilInit(
                child: MaterialApp.router(
                  title: 'Double M',
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.routerConfigurations,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  locale: localizationState.locale,
                  theme: AppTheme.getAppTheme(Themes.light),
                  darkTheme: AppTheme.themes[Themes.dark],
                  themeMode: themingState.darkMode
                      ? ThemeMode.dark
                      : ThemeMode.light,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
