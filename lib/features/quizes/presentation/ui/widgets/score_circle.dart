import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final String score;
  const ScoreCircle({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        score,
        style: const TextStyle(
          color: Color(0xFF08263A),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
