import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';

import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_bloc.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_state.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsScreen extends StatelessWidget {
  static const String path = '/lessons_screen';

  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.lessons),
      body: Center(
        child: BlocBuilder<SectionsAndLessonsBloc, SectionsState>(
          builder: (context, state) {
            return (state is LessonsLoaded && state.lessons.isNotEmpty)
                ? ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    itemCount: state.lessons.length,
                    itemBuilder: (context, index) => LessonCard(
                      lessonEntity: state.lessons[index],
                      index: index + 1,
                    ),
                  )
                : (state is SectionsLoading)
                ? CircularProgressIndicator.adaptive()
                : Text(context.translations.noLessonsAvaliable);
          },
        ),
      ),
    );
  }
}

// 🔶 تصميم كارت السيشن
