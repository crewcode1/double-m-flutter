import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/quiz_question_card.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/submit_quiz_button.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final QuizEntity quizEntity;
  static const String path = '/quiz_screen';

  const QuizScreen({super.key, required this.quizEntity});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<int, int> selectedAnswers = {}; // questionId -> optionIndex
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.quizEntity.title),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 21,
              separatorBuilder: (context, index) => SizedBox(height: 34.h),
              itemBuilder: (context, index) =>
                  index < 20 ? QuizQuestionCard() : SubmitQuizButton(),

              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            ),
          ),

          /// Done Button
        ],
      ),
    );
  }

  /// -------------------------------------------
  /// QUIZ QUESTION BOX (UI مطابق للصورة)
  /// -------------------------------------------
}
