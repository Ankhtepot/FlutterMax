import 'package:flutter/material.dart';
import 'package:roll_dice/enums.dart';

import 'gradient_container.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            gradientType: GradientType.circle,
          ),
        ),
      ),
    );
