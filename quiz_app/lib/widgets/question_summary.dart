import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            StyledText(
              '$questionIndex. ',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            Column(
              children: [
                StyledText(
                  question,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 2),
                if (correctAnswer != userAnswer)
                  StyledText(
                    'Correct answer : $correctAnswer',
                    fontSize: 14,
                    color: Colors.greenAccent,
                  ),
                StyledText(
                  'Your Answer: $userAnswer',
                  fontSize: 14,
                  color: userAnswer != correctAnswer ? Colors.redAccent : Colors.greenAccent,
                ),
              ],
            ),
          ],
        ),
      );
}
