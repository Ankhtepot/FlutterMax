import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

Random random = Random();

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<QuizQuestion> questionsList = List.from(questions);
  QuizQuestion currentQuestion = questions[0];

  int answeredQuestions = 0;
  List<String> score = [];

  @override
  void initState() {
    currentQuestion = questionsList[0];

    super.initState();
  }

  @override
  Widget build(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText(
                currentQuestion.question,
                fontSize: 27,
              ),
              const SizedBox(height: 30),
              ...getButtons(),
            ],
          ),
        ),
      );

  void onPressed(String text) {
    debugPrint('clicked answer: $text');
    score.add(text);
    currentQuestion = questionsList[min(++answeredQuestions, questionsList.length - 1)];
    setState(() {
      if (answeredQuestions == questionsList.length) {
        debugPrint('Quiz finished');
        debugPrint('Score: $score');
      }
    });
  }

  List<Widget> getButtons() {
    final List<Widget> buttons = [];
    final List<String> shuffledAnswers = currentQuestion.getShuffledAnswers();

    for (final answer in shuffledAnswers..shuffle(random)) {
      buttons.add(AnswerButton(answer, onButtonPressed: onPressed));

      if (buttons.length < shuffledAnswers.length) {
        buttons.add(const SizedBox(height: 10));
      }
    }

    return buttons;
  }
}
