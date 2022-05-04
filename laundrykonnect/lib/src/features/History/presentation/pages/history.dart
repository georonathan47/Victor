// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/components/appBar.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/core/constants/widgetFunctions.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key, this.showBefore}) : super(key: key);

  final bool showBefore;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState(this.showBefore);
}

class _HistoryScreenState extends State<HistoryScreen> {
  final bool showBefore;
  _HistoryScreenState(this.showBefore);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: showBefore == false
          ? appBarNoLogo('Order History', true, null, context: context)
          : appBarNoLogo('Order History', true, Colors.black, context: context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.135,
              // padding: const EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.history,
                      color: kSecondColor,
                      size: 30,
                    ),
                  ),
                  title: addSubText("text"),
                  subtitle: addHeaderTextWithStyle('Order Number'),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return addVertical(5);
          },
        ),
      ),
    );
  }
}
