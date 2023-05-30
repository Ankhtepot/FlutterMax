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
  Widget? startScreen;
  Widget? questionsScreen;
  Widget? activeScreen;

  @override
  void initState() {
    startScreen = StartScreen(switchScreen);
    questionsScreen = const QuestionsScreen();
    activeScreen = startScreen;

    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = activeScreen == startScreen ? questionsScreen : startScreen;
    });
  }

  @override
  Widget build(context) => MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: gradientColors,
            child: activeScreen ?? Container(),
          ),
        ),
      );
}
