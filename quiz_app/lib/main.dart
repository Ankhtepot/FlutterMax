import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: GradientContainer.linear(
            gradientColors: [Colors.cyan, Colors.blue],
            child: Text('Hello World'),
          ),
        ),
      );
}
