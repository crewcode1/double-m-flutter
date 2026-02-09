import 'package:doublem/features/main/presentation/ui/widgets/main_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  static final String path = '/main_screen';
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
