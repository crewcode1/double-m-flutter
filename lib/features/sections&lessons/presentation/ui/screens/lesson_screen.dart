import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/presentation/widgets/downnload_attachment.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  static const String path = '/lesson_screen';
  final LessonEntity lessonsEntity;
  const LessonScreen({super.key, required this.lessonsEntity});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.lessonsEntity.title),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),

            // ---------------- MAIN IMAGE + PLAY BUTTON ----------------
            VideoScreen(videoUrl: widget.lessonsEntity.videoUrl),

            const SizedBox(height: 20),

            // ---------------- Sections TITLE ----------------
            Text(
              widget.lessonsEntity.description,
              style: context.textTheme.headlineSmall,
            ),

            const SizedBox(height: 25),

            // ---------------- PDF BOX ----------------
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.lightBlueColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  // PDF ICON BOX
                  Icon(
                    Icons.document_scanner_outlined,
                    color: context.colorScheme.redColor,
                  ),
                  // Assets.images..image(
                  //   width: 55.w,
                  //   height: 55.h,
                  //   color: context.colorScheme.redColor,
                  // ),
                  const SizedBox(width: 12),

                  // TEXT
                  DownloadableFileWidget(
                    filePathFromApi: widget.lessonsEntity.materialUrl,
                  ),

                  // ARROW TO OPEN PDF
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
