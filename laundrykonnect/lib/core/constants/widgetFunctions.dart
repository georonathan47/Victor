// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox addVertical(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox addHorizontal(double width) {
  return SizedBox(
    width: width,
  );
}

Text addHeaderText(String text,
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Text addHeaderTextWithStyle(String text,
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.italic,
    ),
  );
}

Text addSubText(
  String text, {
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.w600,
  Color color = Colors.black,
  FontStyle fontStyle = FontStyle.italic,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: .75,
      fontStyle: fontStyle,
    ),
  );
}
