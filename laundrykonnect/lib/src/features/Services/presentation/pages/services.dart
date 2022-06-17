// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/components/appBar.dart';
import 'package:laundrykonnect/core/constants/colors.dart';

import '../../../../../core/constants/widgetFunctions.dart';
import '../../data/models/ServicesCard.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar:
          appBarNoLogo('Services', true, Colors.transparent, context: context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addHeaderText('Our services include: '),
            const Divider(thickness: .75, color: kBACKGROUND_COLOR),
            addVertical(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ServicesCard(
                    'Washing',
                    'assets/images/4.jpeg',
                    context,
                  ),
                ),
                addHorizontal(10),
                Expanded(
                  child: ServicesCard(
                    'Bulk Washing',
                    'assets/images/laundry1.jpeg',
                    context,
                  ),
                ),
              ],
            ),
            addVertical(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ServicesCard(
                    'Ironing',
                    'assets/images/2.jpeg',
                    context,
                  ),
                ),
                addHorizontal(10),
                Expanded(
                  child: ServicesCard(
                    'Dry Cleaning',
                    'assets/images/newImage.jpeg',
                    context,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
