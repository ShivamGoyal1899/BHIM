import 'package:BHIM/screens/LoginScreens/loginScreen.dart';
import 'package:BHIM/screens/RegistrationScreens/registrationScreen.dart';
import 'package:BHIM/screens/background.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class LoginVerificationScreen extends StatefulWidget {
  @override
  _LoginVerificationScreenState createState() =>
      _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  @override
  void initState() {
    checkRegistrationStatus();
    navigateRegistration();
    super.initState();
  }

  navigateRegistration() async {
    await Future.delayed(const Duration(seconds: 5));
    registrationStatus == 'Registered'
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return LoginScreen();
          }))
        : Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return RegistrationScreen();
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(
            isImage: true,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/loading.gif'),
                Text(
                  'Securing Environment',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
