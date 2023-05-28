import 'dart:ffi';

import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle getButtonRoundBorderStyle(
          {Color color = Colors.white,
          double borderWidth = 5.0,
          double roundStrength = 40.0,
          final double edgeInset = 20}) =>
      ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.white,
            width: borderWidth,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundStrength), // Set the border radius
          ),
        ),
      );
}
