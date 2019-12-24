import 'package:BHIM/screens/DrawerScreens/navigationHomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../global.dart';

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
        Text("Hi " + ReCase(myName).titleCase.split(' ')[0] + ' !',
            style: TextStyle(
                color: Color(0xFF999A9A),
                fontSize: 32,
                fontWeight: FontWeight.w700)),
        SizedBox(height: 20.0),
        Text(
          'Hold the button and speak the following sentence to confirm your identity.',
          style: TextStyle(
              color: Color(0xFF999A9A),
              fontSize: 22,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.0),
        Text(
          '"Hey BHIM"',
          style: TextStyle(
              color: Color(0xFF999A9A),
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.0),
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 85,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(
                    colors: blueGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Icon(Icons.record_voice_over,
                  color: Colors.white, size: 50.0),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onLongPressUp: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  content: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/loading.gif',
                        height: 50,
                      ),
                      Text(
                        '  Verifying Voice !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              );
              await Future.delayed(Duration(seconds: 3));
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  content: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/payment.gif',
                        height: 50,
                      ),
                      Text(
                        'Verified !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              );
              await Future.delayed(Duration(seconds: 2));
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return NavigationHomeScreen();
              }));
            },
          ),
        ),
      ],
    );
  }
}
