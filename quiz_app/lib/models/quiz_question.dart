import 'dart:math';

final random = Random();

class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() => List.of(answers)..shuffle(random);
}
