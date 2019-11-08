import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/profileScreen.dart';
import 'screens/homeScreen.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand'
      ),
      home: MyHomePage(),
    );
  }
}
