import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:doublem/features/settings/presentation/ui/screens/settings_screen.dart';
import 'package:doublem/features/teachers/presentation/ui/screens/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBottomNavigationBar extends StatelessWidget {
  void _onTap({required int index, required BuildContext context}) {
    print(index);
    switch (index) {
      case 0:
        context.go(HomeScreen.path);
      case 1:
        context.go(TeachersScreen.path);
      case 2:
        context.go(SettingsScreen.path);

      default:
        context.go(HomeScreen.path);
    }
  }

  const MainBottomNavigationBar({super.key});

  List<BottomNavigationBarItem> _generateItems({
    required BuildContext context,
  }) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: context.translations.home,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.play_lesson_outlined),
        label: context.translations.teachers,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        label: context.translations.settings,
      ),
    ];
    return items;
  }

  int _currentIndex({required BuildContext context}) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(TeachersScreen.path)) return 1;
    if (location.startsWith(SettingsScreen.path)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(25.r),
        topEnd: Radius.circular(25.r),
      ),
      child: BottomNavigationBar(
        fixedColor: context.colorScheme.brownColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex(context: context),
        items: _generateItems(context: context),
        onTap: (index) => _onTap(index: index, context: context),
      ),
    );
  }
}
