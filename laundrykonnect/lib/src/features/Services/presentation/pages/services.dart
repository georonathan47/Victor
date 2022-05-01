// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/components/appBar.dart';
import 'package:laundrykonnect/core/constants/colors.dart';

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
      appBar: appBarNoLogo('Services', true, context: context),
    );
  }
}
