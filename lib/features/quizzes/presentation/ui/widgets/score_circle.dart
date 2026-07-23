import 'package:doublem/core/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final String score;
  const ScoreCircle({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        score,
        style: TextStyle(
          color: Color(0xFF08263A),
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
