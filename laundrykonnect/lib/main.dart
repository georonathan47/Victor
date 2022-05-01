import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: FlexColorScheme.light(
      //   scheme: FlexScheme.flutterDash
      // ).toTheme,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen2(),
    );
  }
}
