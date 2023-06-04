import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/gradient_container.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/general/data.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  List<Color> activeGradientColors = gradientColors;

  String activeScreen = 'start-screen';

  void switchScreen(String screen) {
    setState(() {
      if (screen == 'questions-screen') {
        _selectedAnswers.clear();
      }

      activeScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      _selectedAnswers.add(answer);
    });

    if (_selectedAnswers.length == questions.length) {
      activeScreen = 'result-screen';
    }
  }

  @override
  Widget build(context) => MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: activeScreen == 'result-screen' ? darkBlueGradientColors : gradientColors,
            child: selectScreen(),
          ),
        ),
      );

  Widget selectScreen() {
    switch (activeScreen) {
      case 'start-screen':
        return StartScreen(switchScreen);
      case 'questions-screen':
        return QuestionsScreen(chooseAnswer);
      case 'result-screen':
        return ResultScreen(switchScreen, _selectedAnswers);
      default:
        return StartScreen(switchScreen);
    }
  }
}
