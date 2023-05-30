import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/widgets/question_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const StyledText(
                'What are the main building blocks of Flutter UIs?',
                fontSize: 27,
              ),
              const SizedBox(height: 30),
              QuestionButton('Functions', onButtonPressed: onPressed),
              QuestionButton('Components', onButtonPressed: onPressed),
              QuestionButton('Blocks', onButtonPressed: onPressed),
              QuestionButton('Widgets', onButtonPressed: onPressed),
            ],
          ),
        ),
      );

  void onPressed(String text) {
    debugPrint(text);
  }
}
