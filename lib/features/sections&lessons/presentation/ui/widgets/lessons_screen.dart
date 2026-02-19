import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';

import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/widgets/lesson_card.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  static const String path = '/lessons_screen';
  final List<LessonEntity> lessons;

  const LessonsScreen({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.lessons),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              itemCount: lessons.length,
              itemBuilder: (context, index) =>
                  LessonCard(lessonEntity: lessons[index], index: index++),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔶 تصميم كارت السيشن
