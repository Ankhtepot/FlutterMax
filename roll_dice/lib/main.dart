import 'package:flutter/material.dart';

import 'dice_roller.dart';
import 'gradient_container.dart';

final List<Color> gradientColors = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  const Color.fromARGB(255, 76, 9, 4),
  Colors.black
];

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: GradientContainer.circle(
            gradientColors: gradientColors,
            child: const Center(child: DiceRoller()),
          ),
        ),
      ),
    );
