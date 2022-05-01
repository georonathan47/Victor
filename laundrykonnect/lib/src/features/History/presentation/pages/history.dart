// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/components/appBar.dart';
import 'package:laundrykonnect/core/constants/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: appBarNoLogo('Order History', true, context: context),
    );
  }
}
