import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(String text, {super.key, Color color = Colors.white, double fontSize = 28})
      : _text = text,
        _color = color,
        _fontSize = fontSize;

  final String _text;
  final Color _color;
  final double _fontSize;

  @override
  Widget build(BuildContext context) => Text(
        _text,
        style: TextStyle(
          fontSize: _fontSize,
          color: _color,
        ),
      );
}
