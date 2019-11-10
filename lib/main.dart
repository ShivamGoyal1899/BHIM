import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi/screens/appLockScreen.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BHIM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand'
      ),
      home: PassCodeScreen(title: 'BHIM'),
    );
  }
}
