import 'package:flutter/material.dart';

List<Color> gradientColors = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  Colors.black
];

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: gradientColors,
                center: Alignment.center,
                radius: 1.3,
                tileMode: TileMode.clamp,
                stops: getGradientStops(),
              ),
            ),
            child: const Center(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );

List<double> getGradientStops() {
  List<double> stops = [];

  for (int i = 0; i < gradientColors.length; i++) {
    double stop = 1 / (gradientColors.length - 1) * i;
    // debugPrint('stop: $stop');
    stops.add(stop);
  }

  return stops;
}
