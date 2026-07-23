import 'package:cached_network_image/cached_network_image.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_bloc.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_state.dart';
import 'package:doublem/features/course/presentation/ui/widgets/course_content_card.dart';
import 'package:doublem/features/live_sessions/presentation/ui/screens/live_sessions_screen.dart';
import 'package:doublem/features/quizzes/presentation/ui/screens/quizzes_screen.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/sections_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CourseScreen extends StatelessWidget {
  static const String path = '/course_screen';
  final EnrolledCourse courseEntity;

  const CourseScreen({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: courseEntity.courseTitle),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: BlocBuilder<CoursesBloc, CoursesState>(
            builder: (context, state) {
              return (state is CoursesLoading)
                  ? CircularProgressIndicator.adaptive()
                  : (state is CourseDetailsLoaded)
                  ? Column(
                      children: [
                        SizedBox(height: 48.h),

                        /// TEACHER TAG BOX
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.beigeColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Teacher Image
                              SizedBox(
                                height: 40.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: CachedNetworkImage(
                                    placeholder: (context, str) => Assets
                                        .images
                                        .teacher
                                        .image(fit: BoxFit.fitHeight),
                                    imageUrl:
                                        state.course.teacherProfileImageUrl,
                                    errorWidget: (context, url, error) => Assets
                                        .images
                                        .teacher
                                        .image(fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.w),

                              /// Teacher Name
                              Text(
                                state.course.teacherName,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.colorScheme.brownColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 14.h),

                        /// DESCRIPTION TEXT
                        Expanded(
                          child: Text(
                            state.course.description,
                            textAlign: TextAlign.start,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: 15.h),

                        /// SectionsS BUTTON
                        CourseContentCard(
                          color:
                              (state.course.sections == null ||
                                  state.course.sections!.isEmpty)
                              ? context.colorScheme.lightGreyColor
                              : null,
                          title: context.translations.sections,
                          onTap:
                              (state.course.sections == null ||
                                  state.course.sections!.isEmpty)
                              ? null
                              : () => context.push(
                                  SectionsScreen.path,
                                  extra: state.course.sections,
                                ),
                        ),

                        SizedBox(height: 15.h),
                        CourseContentCard(
                          title: context.translations.quizzes,
                          color:
                              (state.course.quizzes == null ||
                                  state.course.quizzes!.isEmpty)
                              ? context.colorScheme.lightGreyColor
                              : null,
                          onTap:
                              (state.course.quizzes == null ||
                                  state.course.quizzes!.isEmpty)
                              ? null
                              : () => context.push(
                                  QuizzesScreen.path,
                                  extra: state.course.quizzes,
                                ),
                        ),
                        SizedBox(height: 15.h),
                        CourseContentCard(
                          title: context.translations.liveSessions,
                          onTap: () {
                            context.push(
                              LiveSessionsScreen.path,
                              extra: state.course.id,
                            );
                          },
                        ),

                        SizedBox(height: 100.h),
                      ],
                    )
                  : (state is CoursesError)
                  ? Text(state.message)
                  : Text(context.translations.failedToLoadData);
            },
          ),
        ),
      ),
    );
  }
}
