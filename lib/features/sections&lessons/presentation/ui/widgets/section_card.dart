import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/lessons_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionCard extends StatelessWidget {
  final SectionEntity sectionEntity;
  final int index;
  const SectionCard({
    super.key,
    required this.sectionEntity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(LessonsScreen.path, extra: sectionEntity.id);
      },
      child: SizedBox(
        height: 104.h,
        child: Stack(
          children: [
            PositionedDirectional(
              top: 8.h,
              start: 0,
              child: Container(
                width: 343.w,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.whiteColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// رقم السيشن

                    /// عنوان السيشن
                    Expanded(
                      child: Text(
                        sectionEntity.title,
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
                  child: Text(
                    index.toString(),
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
