import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/pdf_screen.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/videos/video_player_screen.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/videos/youtube_video_player_screen.dart';
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
      body: Column(
        children: [
          CustomAppBar(title: widget.lessonsEntity.title),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),

              child: Column(
                children: [
                  if (widget.lessonsEntity.videoType == 0)
                    YouTubeVideoScreen(videoUrl: widget.lessonsEntity.videoUrl),
                  if (widget.lessonsEntity.videoType == 1)
                    NetworkVideoPlayerScreen(
                      videoUrl: widget.lessonsEntity.videoUrl,
                    ),

                  const SizedBox(height: 20),

                  if (widget.lessonsEntity.materialUrl.isNotEmpty)
                    SecurePdfScreen(pdfUrl: widget.lessonsEntity.materialUrl),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
