// ignore_for_file: file_names

import 'package:flutter/material.dart';

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

Text addHeaderText(
  String text,
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Text addSubText(
  String text,
    {double fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
    Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}