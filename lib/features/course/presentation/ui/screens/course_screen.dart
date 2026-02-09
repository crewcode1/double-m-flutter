import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/course/presentation/ui/widgets/course_content_card.dart';
import 'package:doublem/features/quizes/presentation/ui/screens/quizzes_screen.dart';
import 'package:doublem/features/sessions/presentation/ui/screens/sessions_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseScreen extends StatelessWidget {
  static const String path = '/course_screen';

  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chemistry'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 48.h),

            /// TEACHER TAG BOX
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.colorScheme.beigeColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Teacher Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Assets.images.teacher.image(
                      height: 35.h,
                      width: 35.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 5.w),

                  /// Teacher Name
                  Text(
                    'teacher Name',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.brownColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 14.h),

            /// DESCRIPTION TEXT
            Text(
              'The chemistry course with Dr. Ahmed Murad will help you understand the subject in an easy and organized way.\n\nYou will learn the most important chemical concepts and reactions with simple examples and exercises that reinforce the information.',
              textAlign: TextAlign.start,
              style: context.textTheme.bodyMedium,
            ),

            const SizedBox(height: 30),

            /// SESSIONS BUTTON
            CourseContentCard(
              title: context.translations.sessions,
              onTap: () => context.push(SessionsScreen.path),
            ),

            SizedBox(height: 15.h),
            CourseContentCard(
              title: context.translations.quizzes,
              onTap: () => context.push(QuizzesScreen.path),
            ),
          ],
        ),
      ),
    );
  }
}
