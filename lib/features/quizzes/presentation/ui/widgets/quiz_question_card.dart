import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:doublem/features/quizzes/presentation/controllers/solving_quiz_cubit/solving_quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizQuestionCard extends StatelessWidget {
  final QuestionEntity questionEntity;
  final int index;

  const QuizQuestionCard({
    super.key,
    required this.questionEntity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 104.h,
          child: Stack(
            children: [
              PositionedDirectional(
                top: 4.h,
                start: 4.w,
                child: Container(
                  width: 343.w,
                  height: 100.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.lightBlueColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(questionEntity.text)),
                      SizedBox(width: 10.w),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Assets.images.section.image(
                          width: 73.w,
                          height: 73.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                top: 0.h,
                start: 0.w,
                child: CircleAvatar(
                  radius: 10.r,
                  child: Text((index + 1).toString()),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 13.h),

        /// ✅ الإجابات (optimized)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: List.generate(questionEntity.options.length, (i) {
              final option = questionEntity.options[i];

              return BlocSelector<SolvingQuizCubit, SolvingQuizState, bool>(
                selector: (state) {
                  final list =
                      state.selectedAnswers['${questionEntity.id}'] ?? [];
                  return list.contains(option.id);
                },
                builder: (context, isSelected) {
                  final cubit = context.read<SolvingQuizCubit>();

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.selectAnswer(
                            questionType: questionEntity.questionType,
                            questionId: questionEntity.id,
                            answer: option.id,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.colorScheme.primaryColor
                                : context.colorScheme.lightBlueColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 23.w,
                            vertical: 7.h,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10.r,
                                backgroundColor: isSelected
                                    ? context.colorScheme.lightBlueColor
                                    : context.colorScheme.primaryColor,
                                child: Text(
                                  (i + 1).toString(),
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color: isSelected
                                        ? context.colorScheme.primaryColor
                                        : context.colorScheme.lightBlueColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 17.w),
                              Text(
                                option.text.toString(),
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: isSelected
                                      ? context.colorScheme.lightBlueColor
                                      : context.colorScheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
