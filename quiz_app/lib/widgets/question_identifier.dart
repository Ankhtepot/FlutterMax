import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/styled_text.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.isIncorrect, this.questionIndex, {super.key});

  final bool isIncorrect;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isIncorrect ? const Color.fromARGB(255, 250, 98, 98) : const Color.fromARGB(255, 127, 251, 191),
        borderRadius: BorderRadius.circular(50),
      ),
      child: StyledText(
        '$questionIndex',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 30, 255),
      ),
    );
  }
}