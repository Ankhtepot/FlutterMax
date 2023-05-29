import 'package:flutter/material.dart';
import 'package:quiz_app/general/data.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/widgets/common/gradient_container.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: gradientColors,
            child: Center(child: StartScreen()),
          ),
        ),
      ),
    );
