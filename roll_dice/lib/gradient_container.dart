import 'package:flutter/material.dart';
import 'package:roll_dice/styled_text.dart';

import 'enums.dart';

Alignment startAlignment = Alignment.topLeft;
Alignment endAlignment = Alignment.bottomRight;
Alignment centerAlignment = Alignment.center;

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, GradientType gradientType = GradientType.linear}) : _gradientType = gradientType;

  final GradientType _gradientType;

  final List<Color> gradientColors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    const Color.fromARGB(255, 76, 9, 4),
    Colors.black
  ];

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            _gradientType == GradientType.linear ? getGradientLinearDecoration() : getGradientCircleDecoration(),
        child: const Center(
          child: StyledText(
            'Hello World Old',
          ),
        ),
      );

  List<double> getGradientStops({start = 0, end = 1}) {
    List<double> stops = [];

    for (int i = 0; i < gradientColors.length; i++) {
      double stop = start + (end - start) / (gradientColors.length - 1) * i;
      // debugPrint('stop: $stop');
      stops.add(stop);
    }

    return stops;
  }

  BoxDecoration getGradientLinearDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: startAlignment,
          end: endAlignment,
          tileMode: TileMode.clamp,
          stops: getGradientStops(),
        ),
      );

  BoxDecoration getGradientCircleDecoration() => BoxDecoration(
        gradient: RadialGradient(
          colors: gradientColors,
          center: centerAlignment,
          radius: 1.4,
          tileMode: TileMode.clamp,
          stops: getGradientStops(start: 0.3),
        ),
      );
}
