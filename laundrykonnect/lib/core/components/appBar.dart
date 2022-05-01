// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/widgetFunctions.dart';

AppBar appBar(String text, bool isDashboard, {BuildContext context}) {
  return AppBar(
    backgroundColor: AZURE,
    elevation: 0.5,
    leading: isDashboard
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5),
            child: Image.asset(
              'assets/images/logo.png',
              height: 30,
              filterQuality: FilterQuality.high,
            ),
          )
        : IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.black,
              size: 30,
            ),
          ),
    centerTitle: true,
    title: addSubText(text, fontStyle: FontStyle.normal),
  );
}
