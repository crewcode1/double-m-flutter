import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:doublem/features/course/presentation/ui/screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrentCourseCard extends StatelessWidget {
  final EnrolledCourse courseEntity;
  const CurrentCourseCard({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CourseScreen.path, extra: courseEntity);
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10.r),
        child: Container(
          height: 182.h,
          width: 159.w,
          padding: EdgeInsets.symmetric(
            vertical: (13.5).h,
            horizontal: (11.5).w,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10.r,
                spreadRadius: -3,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.course.image(),
              SizedBox(height: 5.h),
              Text(
                courseEntity.courseTitle,
                style: context.textTheme.labelLarge?.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                courseEntity.teacherName,
                style: context.textTheme.labelMedium?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                courseEntity.enrolledAt.toString(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.brownColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          // child: Column(
          //   children: [
          //     ClipRRect(
          //       borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(14),
          //         topRight: Radius.circular(14),
          //       ),
          //       child: Image.asset(
          //         course["image"],
          //         height: 90,
          //         width: double.infinity,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     const SizedBox(height: 8),

          //     Text(
          //       course["title"],
          //       style: const TextStyle(
          //         color: Color(0xFF08263A),
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),

          //     Text(
          //       course["teacher"],
          //       style: const TextStyle(color: Color(0xFF08263A), fontSize: 14),
          //     ),

          //     Text(
          //       "${course["daysRemaining"]} days remaining",
          //       style: const TextStyle(
          //         color: Color(0xFF9E8358),
          //         fontSize: 14,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),

          //     const SizedBox(height: 12),
          //   ],
          // ),
        ),
      ),
    );
  }
}
