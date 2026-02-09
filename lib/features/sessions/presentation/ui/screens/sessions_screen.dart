import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/sessions/presentation/ui/widgets/session_card.dart';
import 'package:flutter/material.dart';

class SessionsScreen extends StatelessWidget {
  static const String path = '/sessions_screen';

  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Sessions"),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              itemCount: 10,
              itemBuilder: (context, index) => SessionCard(),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔶 تصميم كارت السيشن
