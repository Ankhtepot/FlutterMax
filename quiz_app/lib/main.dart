import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: [Color.fromARGB(255, 135, 215, 225), Colors.cyan, Colors.blue],
            child: Center(child: WelcomeScreen()),
          ),
        ),
      ),
    );
