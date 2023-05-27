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
            decoration: getGradientLinearDecoration(),
            child: const Center(
              child: Text(
                'Hello World',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
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

BoxDecoration getGradientLinearDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: gradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp,
      stops: getGradientStops(),
    ),
  );
}

BoxDecoration getGradientCircleDecoration() {
  return BoxDecoration(
    gradient: RadialGradient(
      colors: gradientColors,
      center: Alignment.center,
      radius: 1.4,
      tileMode: TileMode.clamp,
      stops: getGradientStops(start: 0.3),
    ),
  );
}
