import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styled_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 200, height: 200),
          const StyledText(
            'Learn Flutter the fun way!',
            fontSize: 20,
          ),
          TextButton(
              onPressed: onPressed,
              child: const StyledText(
                'Start Quiz',
                fontSize: 15,
              ))
        ],
      );

  void onPressed() {
    debugPrint('Button pressed');
  }
}
