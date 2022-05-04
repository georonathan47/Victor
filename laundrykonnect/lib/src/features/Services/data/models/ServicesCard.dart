// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/widgetFunctions.dart';

Container ServicesCard(String title, String image, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 4,
    decoration: const BoxDecoration(
      color: kSecondColor,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(3),
    child: Card(
      elevation: .45,
      color: kBACKGROUND_COLOR,
      child: Stack(
        children: [
          Image.asset(image),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: addSubText(title, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
