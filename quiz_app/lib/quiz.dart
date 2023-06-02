import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/gradient_container.dart';
import 'package:quiz_app/general/data.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = activeScreen == 'start-screen' ? 'question-screen' : 'start-screen';
    });
  }

  @override
  Widget build(context) => MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: gradientColors,
            child: activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen(),
          ),
        ),
      );
}
