import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/gradient_container.dart';
import 'package:quiz_app/general/data.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

Widget startScreen = const StartScreen();
Widget questionsScreen = const QuestionsScreen();

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) => const MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: gradientColors,
            child: Center(child: StartScreen()),
          ),
        ),
      );
}
