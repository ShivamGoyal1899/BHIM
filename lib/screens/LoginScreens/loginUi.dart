import 'package:BHIM/screens/DrawerScreens/navigationHomeScreen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50.0),
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 85,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(
                    colors: signInGradients,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Icon(Icons.record_voice_over,
                  color: Colors.white, size: 50.0),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return NavigationHomeScreen();
              }));
            },
          ),
        ),
        SizedBox(height: 30.0),
        Text("Voice Login",
            style: TextStyle(
                color: Color(0xFF999A9A),
                fontSize: 22,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
