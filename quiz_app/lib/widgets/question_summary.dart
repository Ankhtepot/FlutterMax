import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/widgets/question_identifier.dart';

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

  bool get isIncorrect => correctAnswer != userAnswer;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionIdentifier(isIncorrect, questionIndex),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    question,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 2),
                  if (isIncorrect)
                    StyledText(
                      'Correct answer : $correctAnswer',
                      fontSize: 16,
                      color: const Color.fromARGB(255, 127, 251, 191),
                      textAlign: TextAlign.left,
                    ),
                  StyledText(
                    'Your Answer: $userAnswer',
                    fontSize: 16,
                    color: isIncorrect ? const Color.fromARGB(255, 250, 98, 98) : Colors.greenAccent,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
