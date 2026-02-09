import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/features/course/presentation/ui/screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrentCourseCard extends StatelessWidget {
  const CurrentCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CourseScreen.path);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => CourseScreen(
        //       courseId: course["id"],
        //       title: course["title"],
        //       teacherName: course["teacher"],
        //       description: "Course description goes here...",
        //     ),
        //   ),
        // );
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
            children: [
              Assets.images.course.image(),
              SizedBox(height: 5.h),
              Text('Chemistry', style: context.textTheme.labelLarge),
              Text('Mr. Ahmed', style: context.textTheme.labelLarge),
              Text(
                '20 Days remaining',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.brownColor,
                ),
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
