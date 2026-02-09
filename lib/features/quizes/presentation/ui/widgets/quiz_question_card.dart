import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';

class QuizQuestionCard extends StatelessWidget {
  const QuizQuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   context.push('/session_screen');
      // },
      child: Column(
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
                            'Which of the following is a bond in which electrons are transferred from one atom to another?',
                            // overflow: TextOverflow.visible,
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// صورة السيشن
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.images.session.image(
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
                  child: CircleAvatar(radius: 10.r, child: Text('1')),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.h),
          SizedBox(
            height: 160.h,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) => Container(
                height: 34.h,
                decoration: BoxDecoration(
                  color: context.colorScheme.lightBlueColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 7.h),
                child: Row(
                  children: [
                    CircleAvatar(radius: 10.r, child: Text('1')),
                    SizedBox(width: 17.w),
                    Text('Covalent'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
