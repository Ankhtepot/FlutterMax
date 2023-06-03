import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/common/widgets/styles.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onButtonPressed, {super.key});

  final void Function(String) onButtonPressed;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 80),
            const StyledText(
              'Learn Flutter the fun way!',
              fontSize: 20,
              fontFamilly: 'Lato',
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () => onButtonPressed('questions-screen'),
              style: Styles.getButtonStadiumBorder(),
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white, size: 30),
              label: const StyledText(
                'Start Quiz',
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
}
