import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionScreen extends StatelessWidget {
  static const String path = '/Section_screen';
  final SectionEntity sectionEntity;
  const SectionScreen({super.key, required this.sectionEntity});

  Future<void> openPdf(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to open PDF")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: sectionEntity.title),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),

            // ---------------- MAIN IMAGE + PLAY BUTTON ----------------
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(25.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Assets.images.section.image(
                      width: 343.w,
                      height: 180.h,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),

                    Icon(
                      Icons.play_circle_outline_rounded,
                      size: 34,
                      color: context.colorScheme.blackColor,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- Sections TITLE ----------------
            Text(
              'Chemical bonds, their types, and their effect on the properties of compounds.',
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
                  Assets.images.quizIcon.image(
                    width: 55.w,
                    height: 55.h,
                    color: context.colorScheme.redColor,
                  ),
                  const SizedBox(width: 12),

                  // TEXT
                  Expanded(
                    child: Text(
                      "Please open the attached PDF file to view the lesson content.",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colorScheme.blueGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // ARROW TO OPEN PDF
                  GestureDetector(
                    onTap: () async {
                      await openPdf(
                        context,
                        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                      );
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
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
