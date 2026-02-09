import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int quizId;
  final int score;
  final int total;

  const QuizResultScreen({
    super.key,
    required this.quizId,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    bool passed = score >= 6;

    return Scaffold(
      backgroundColor: const Color(0xFFF6EEDC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Row(
                children: const [
                  Icon(Icons.arrow_back, size: 30, color: Color(0xFF08263A)),
                  SizedBox(width: 18),
                  Text(
                    "Quizzes",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF08263A),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// RESULT BOX
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: passed ? Colors.green.shade300 : Colors.red.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Text(
                        "$quizId",
                        style: const TextStyle(
                          color: Color(0xFF08263A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Testing your understanding...Testing your understanding...",
                        style: TextStyle(
                          color: Color(0xFF08263A),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "$score/$total",
                        style: const TextStyle(
                          color: Color(0xFF08263A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// NEXT QUIZZES LIST
              ...List.generate(5, (i) {
                bool locked = i > 0; // only first quiz unlocked

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1E1E6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF08263A),
                        radius: 16,
                        child: Text(
                          "${i + 1}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Testing your understanding...Testing your understanding...",
                          style: TextStyle(
                            color: Color(0xFF08263A),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Icon(
                        locked ? Icons.lock : Icons.help_outline,
                        color: const Color(0xFF08263A),
                      )
                    ],
                  ),
                );
              }),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
