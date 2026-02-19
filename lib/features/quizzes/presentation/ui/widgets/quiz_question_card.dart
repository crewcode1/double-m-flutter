import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';

class QuizQuestionCard extends StatefulWidget {
  final QuestionEntity questionEntity;
  final int index;
  const QuizQuestionCard({
    super.key,
    required this.questionEntity,
    required this.index,
  });

  @override
  State<QuizQuestionCard> createState() => _QuizQuestionCardState();
}

class _QuizQuestionCardState extends State<QuizQuestionCard> {
  int answer = -1;
  void _selectAnswer({required int index}) {
    setState(() {
      if (index == answer) {
        answer = -1;
      } else {
        answer = (index);
      }
    });
  }

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// رقم السيشن

                      /// عنوان السيشن
                      Expanded(
                        child: Text(
                          widget.questionEntity.text,
                          // overflow: TextOverflow.visible,
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// صورة السيشن
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
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
                  child: Text((widget.index + 1).toString()),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 13.h),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          // height: 160.h,
          child: Column(
            children: List.generate(
              widget.questionEntity.options.length,
              (index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectAnswer(index: index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: answer == index
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
                            child: Text((index + 1).toString()),
                          ),
                          SizedBox(width: 17.w),
                          Text(
                            widget.questionEntity.options[index].text
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
