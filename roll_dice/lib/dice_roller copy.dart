import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> with SingleTickerProviderStateMixin {
  String activeDiceImage = 'assets/images/dice-1.png';
  late AnimationController _animationController;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final colorTween = TweenSequence<Color?>([
      TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.white,
            end: Colors.cyan,
          ),
          weight: 0.5),
      TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.cyan,
            end: Colors.white,
          ),
          weight: 0.5),
    ]);

    _borderColorAnimation = _animationController.drive(colorTween);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            onPressed: () {
              _animationController.forward(from: 0.0);

              rollDice();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: _borderColorAnimation.value ?? Colors.white, // Use the animated border color
                  width: 5.0,
                ),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
            child: const Text(
              'Roll Dice',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
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
    int randomNumber = Random().nextInt(6) + 1;

    setState(() {
      activeDiceImage = diceImagesPaths[randomNumber - 1];
    });
  }
}
