import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,
      {super.key,
      this.color = Colors.white,
      this.fontSize = 28,
      this.fontFamilly = 'Roboto',
      this.fontWeight = FontWeight.normal});

  final String text;
  final Color color;
  final double fontSize;
  final String fontFamilly;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont(
          fontFamilly,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      );
}
