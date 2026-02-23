import 'package:cached_network_image/cached_network_image.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/teachers/domain/entities/teacher_entity.dart';
import 'package:flutter/material.dart';

class TeacherScreen extends StatelessWidget {
  static final String path = '/teacher_screen';
  final TeacherEntity teacherEntity;
  const TeacherScreen({super.key, required this.teacherEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: teacherEntity.fullName),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
        child: Column(
          children: [
            Container(
              width: 349.w,
              height: 400.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(20.r),
                color: context.colorScheme.beigeColor,
              ),

              child: Row(
                spacing: 12.w,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(100.r),
                            child: teacherEntity.profileImageUrl != null
                                ? CachedNetworkImage(
                                    placeholder: (context, url) => Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                    fit: BoxFit.cover,
                                    imageUrl: teacherEntity.profileImageUrl!,
                                    errorWidget: (context, url, error) => Assets
                                        .images
                                        .teacher
                                        .image(fit: BoxFit.fitHeight),
                                  )
                                : Assets.images.teacher.image(
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            teacherEntity.fullName,
                            style: context.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 30.h),
                          Assets.images.logo.image(height: 100.h, width: 100.w),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.horizontal(
                          end: Radius.circular(20.r),
                        ),
                        color: context.colorScheme.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            teacherEntity.specialty,
                            style: context.textTheme.titleLarge,
                          ),
                          Divider(
                            height: 5.h,
                            endIndent: 5,
                            indent: 5,
                            color: context.colorScheme.whiteColor,
                          ),

                          Text(
                            teacherEntity.description,
                            style: context.textTheme.titleSmall,
                          ),
                          Divider(
                            height: 5.h,
                            endIndent: 5,
                            indent: 5,
                            color: context.colorScheme.whiteColor,
                          ),
                          Text(
                            teacherEntity.email,
                            style: context.textTheme.titleSmall,
                          ),
                          Divider(
                            height: 5.h,
                            endIndent: 5,
                            indent: 5,
                            color: context.colorScheme.whiteColor,
                          ),
                          Row(
                            children: [
                              Text(
                                teacherEntity.phoneNumber,
                                style: context.textTheme.titleSmall,
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.call,
                                color: context.colorScheme.whiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Expanded(
                  //
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 7.h),
                  //     decoration: BoxDecoration(
                  //       color: context.colorScheme.darkBeigeColor,
                  //       borderRadius: BorderRadius.circular(14),
                  //     ),
                  //     child: Column(
                  //       // crossAxisAlignment: CrossAxisAlignment.start,
                  //       spacing: 6.h,
                  //       children: [
                  //         Text(
                  //           teacherEntity.fullName,
                  //           style: context.textTheme.titleLarge,
                  //         ),
                  //         TeacherDetailValueCard(
                  //           cardColor: context.colorScheme.lightBlueColor,
                  //           detailColor: context.colorScheme.primaryColor,
                  //           valueColor: context.colorScheme.greyColor,
                  //           detailTitle: "Specialization",
                  //           valueTitle: teacherEntity.specialty,
                  //         ),
                  //         TeacherDetailValueCard(
                  //           cardColor: context.colorScheme.lightBlueColor,
                  //           detailColor: context.colorScheme.primaryColor,
                  //           valueColor: context.colorScheme.greyColor,
                  //           detailTitle: "Age state",
                  //           valueTitle: teacherEntity.description,
                  //         ),
                  //         TeacherDetailValueCard(
                  //           cardColor: context.colorScheme.lightBrownColor,
                  //           detailColor: context.colorScheme.whiteColor,
                  //           valueColor: context.colorScheme.whiteColor,
                  //           detailTitle: "Number",
                  //           valueTitle: teacherEntity.phoneNumber,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
