import 'dart:ui';

import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizCard extends StatelessWidget {
  final bool locked;
  final bool completed;
  const QuizCard({super.key, required this.locked, required this.completed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/quiz_screen');
      },
      child: SizedBox(
        height: 113.h,
        width: 352.w,
        child: Stack(
          children: [
            PositionedDirectional(
              top: 13.h,
              start: 4.w,
              child: Container(
                width: 343.w,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.lightBlueColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// رقم السيشن

                    /// عنوان السيشن
                    Expanded(
                      child: Text(
                        'Chemical bonds, their types, and their effect on the properties of compounds.',
                        // overflow: TextOverflow.visible,
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// صورة السيشن
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: completed
                          ? Assets.icons.lock.svg(
                              width: 51.w,
                              height: 51.h,
                              fit: BoxFit.cover,
                            )
                          : Assets.images.quizIcon.image(
                              width: 51.w,
                              height: 51.h,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: 7.h,
              child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.primaryColor,
                    width: 2.w,
                  ),
                ),

                // padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                child: Center(
                  child: Text('1', style: context.textTheme.bodyLarge),
                ),
              ),
            ),
            locked
                ? PositionedDirectional(
                    top: 0.h,
                    end: 0.w,
                    child: SizedBox(
                      height: 25.h,
                      width: 25.w,

                      // padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                      child: Assets.icons.lock.svg(
                        color: context.colorScheme.primaryColor,
                      ),
                    ),
                  )
                : PositionedDirectional(
                    top: 0.h,
                    end: 0.w,
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: context.colorScheme.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colorScheme.greenColor,
                          width: 2.w,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '6/10',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.redColor,
                          ),
                        ),
                      ),
                    ),
                  ),
            if (locked)
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
                  child: Container(
                    height: 120,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
