import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/presentation/widgets/custom_loading.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_bloc.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_state.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/quiz_question_card.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/submit_quiz_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Center(
        child: BlocBuilder<QuizzesBloc, QuizzesState>(
          builder: (context, state) {
            return (state is QuizLoaded && state.quiz.questions != null)
                ? ListView.separated(
                    itemCount: state.quiz.questions!.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 34.h),
                    itemBuilder: (context, index) =>
                        index < ((state.quiz.questions!.length) - 1)
                        ? QuizQuestionCard(
                            questionEntity: state.quiz.questions![index],
                            index: index,
                          )
                        : SubmitQuizButton(),

                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 25.h,
                    ),
                  )
                : (state is QuizLoading)
                ? CustomLoadingWidget()
                : Text(
                    state is QuizzesError
                        ? state.message
                        : context.translations.failedToLoadData,
                  );
          },
        ),
      ),
    );
  }

  /// -------------------------------------------
  /// QUIZ QUESTION BOX (UI مطابق للصورة)
  /// -------------------------------------------
}
