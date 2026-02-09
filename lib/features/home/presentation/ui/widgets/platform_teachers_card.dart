import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/home/presentation/ui/widgets/teacher_detail_value_card.dart';
import 'package:doublem/features/teachers/presentation/ui/screens/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlatformTeachersCard extends StatelessWidget {
  const PlatformTeachersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(TeachersScreen.path);
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20.r),
        child: Container(
          height: 141.h,
          width: 343.w,
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
          decoration: BoxDecoration(
            gradient: context.colorScheme.teachersGradient,
            boxShadow: [
              BoxShadow(
                blurRadius: 40.r,
                spreadRadius: 4.r,
                offset: Offset(0, 4),
                color: context.colorScheme.darkBeigeColor.withAlpha(255),
              ),
            ],
          ),
          child: Row(
            spacing: 12.w,
            children: [
              Expanded(
                flex: 1,
                child: Assets.images.teacher.image(fit: BoxFit.fitHeight),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                    color: context.colorScheme.darkBeigeColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6.h,
                    children: [
                      Text(
                        "Dr. ahmed hassan",
                        style: context.textTheme.titleLarge,
                      ),
                      TeacherDetailValueCard(
                        cardColor: context.colorScheme.lightBlueColor,
                        detailColor: context.colorScheme.primaryColor,
                        valueColor: context.colorScheme.greyColor,
                        detailTitle: "Specialization",
                        valueTitle: "Physics",
                      ),
                      TeacherDetailValueCard(
                        cardColor: context.colorScheme.lightBlueColor,
                        detailColor: context.colorScheme.primaryColor,
                        valueColor: context.colorScheme.greyColor,
                        detailTitle: "Age state",
                        valueTitle: "University",
                      ),
                      TeacherDetailValueCard(
                        cardColor: context.colorScheme.lightBrownColor,
                        detailColor: context.colorScheme.whiteColor,
                        valueColor: context.colorScheme.whiteColor,
                        detailTitle: "Number",
                        valueTitle: "01272731714",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
