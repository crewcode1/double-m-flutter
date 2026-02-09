import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/quizes/presentation/ui/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  static const String path = '/quizzes_screen';
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Quizes"),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => QuizCard(
                  locked: (index % 2 == 0) ? true : false,
                  completed: (index % 2 == 1) ? true : false,
                ),
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 14,
              ),
            ),

            /// QUIZ ITEMS LIST
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
