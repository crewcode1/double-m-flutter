import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  static const String path = '/quizzes_screen';
  final List<QuizEntity> quizzes;
  const QuizzesScreen({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.quizzes),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    QuizCard(quizEntity: quizzes[index]),
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: quizzes.length,
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
