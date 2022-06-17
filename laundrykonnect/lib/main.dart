// import 'package:flex_color_scheme/flex_color_scheme.dart';
// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'Index.dart';
import 'splash2.dart';

// import 'Splash.dart';

void main() {
  runApp(const LaundryKonnect());
}

class LaundryKonnect extends StatelessWidget {
  const LaundryKonnect({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: SplashScreen2(),
      home: Index(name: "victor"),
    );
  }
}
