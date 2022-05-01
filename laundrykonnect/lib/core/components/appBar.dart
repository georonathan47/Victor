// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/widgetFunctions.dart';
AppBar appBar(String text) {
    return AppBar(
      backgroundColor: AZURE,
      elevation: 0.5,
      title: addSubText(text),
    );
  }