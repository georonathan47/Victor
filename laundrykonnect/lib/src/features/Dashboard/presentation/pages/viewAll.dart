// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/constants/colors.dart';

import '../../../../../core/components/appBar.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: appBar('View All', false, false, context: context),
    );
  }
}
