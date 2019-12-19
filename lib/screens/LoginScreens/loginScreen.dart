import 'package:BHIM/global.dart';
import 'package:flutter/material.dart';

import '../background.dart';
import 'loginUi.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(isImage: true),
          Login(),
        ],
      ),
    );
  }
}
