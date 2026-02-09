import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/session_screen');
      },
      child: SizedBox(
        height: 104.h,
        child: Stack(
          children: [
            PositionedDirectional(
              top: 4.h,
              child: Container(
                width: 343.w,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 16.h),
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
          ],
        ),
      ),
    );
  }
}
