import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/appLockScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BHIMApp());
}

class BHIMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BHIM',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Quicksand'),
      home: AppLockScreen(title: 'BHIM'),
    );
  }
}
