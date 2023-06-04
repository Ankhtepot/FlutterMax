import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/common/widgets/styles.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.onButtonPressed, this.answers, {super.key});

  final void Function(String) onButtonPressed;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    final int numberOfQuestions = questions.length;

    debugPrint(answers.toString());
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == questions[i].answers[0]) {
        correctAnswers++;
      }
    }

    List<Widget> getResults() {
      final List<Widget> results = [];

      for (int i = 0; i < answers.length; i++) {
        results.add(QuestionSummary(
          questionIndex: i + 1,
          question: questions[i].question,
          correctAnswer: questions[i].answers[0],
          userAnswer: answers[i],
        ));
        if (i != answers.length - 1) {
          results.add(const SizedBox(height: 10));
        }
      }

      return results;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
              'You answered $correctAnswers out of $numberOfQuestions correctly!',
              fontSize: 24,
              fontFamilly: 'Lato',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            ...getResults(),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () => onButtonPressed('questions-screen'),
              style: Styles.getButtonStadiumBorder(),
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white, size: 30),
              label: const Text(
                'Start Again',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
