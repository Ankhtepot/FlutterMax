import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice/styles.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = 'assets/images/dice-1.png';
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            activeDiceImage,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: rollDice,
            style: Styles.getButtonRoundBorderStyle(),
            child: const Text('Roll Dice', style: TextStyle(color: Colors.white, fontSize: 28)),
          ),
        ],
      );

  List<String> diceImagesPaths = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];

  void rollDice() {
    int randomNumber = randomizer.nextInt(6) + 1;

    setState(() {
      activeDiceImage = diceImagesPaths[randomNumber - 1];
    });
  }
}
