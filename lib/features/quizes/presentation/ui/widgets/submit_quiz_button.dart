import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:flutter/material.dart';

class SubmitQuizButton extends StatelessWidget {
  const SubmitQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // final total = questions.length;
        // int score = 0;

        // for (var q in questions) {
        //   if (selectedAnswers[q.id] == q.correctIndex) {
        //     score++;
        //   }
        // }

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => QuizResultScreen(
        //       quizId: widget.quizId,
        //       total: total,
        //       score: score,
        //     ),
        //   ),
        // );
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: context.colorScheme.primaryColor,
          borderRadius: BorderRadius.circular((12.5).r),
        ),
        child: Center(
          child: Text(
            context.translations.done,
            style: context.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
