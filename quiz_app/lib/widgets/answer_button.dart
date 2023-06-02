import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';
import 'package:quiz_app/common/widgets/styles.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.text, {
    super.key,
    required this.onButtonPressed,
  });

  final void Function(String) onButtonPressed;
  final String text;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: Styles.getButtonStadiumBorder(
            backgroundColor: const Color.fromARGB(255, 47, 6, 210),
            borderColor: Colors.blue,
          ),
          child: StyledText(
            text,
            fontSize: 15,
          ),
        ),
      );
}
