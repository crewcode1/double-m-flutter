import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections/presentation/ui/widgets/section_card.dart';
import 'package:flutter/material.dart';

class SectionsScreen extends StatelessWidget {
  static const String path = '/Sections_screen';
  final List<SectionEntity> sections;

  const SectionsScreen({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.sections),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              itemCount: sections.length,
              itemBuilder: (context, index) =>
                  SectionsCard(sectionEntity: sections[index]),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔶 تصميم كارت السيشن
