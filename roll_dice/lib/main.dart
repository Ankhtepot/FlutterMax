import 'package:flutter/material.dart';

List<Color> gradientColors = [
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
];

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: gradientColors,
                center: Alignment.center,
                radius: 1,
                tileMode: TileMode.clamp,
                stops: const [
                  0.4,
                  0.6,
                  0.8,
                  1.0,
                ],
              ),
            ),
            child: const Center(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
