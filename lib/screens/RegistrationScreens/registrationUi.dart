import 'package:BHIM/screens/loginVerificationScreen.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final upiIDcontroller = TextEditingController();
  FocusNode nameFocusNode;
  FocusNode mobileNumberFocusNode;
  FocusNode upiIDFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40, bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30.0))),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  focusNode: nameFocusNode,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle:
                          TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40, bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30.0))),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                child: TextField(
                  controller: mobileNumberController,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.none,
                  focusNode: mobileNumberFocusNode,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number",
                      hintStyle:
                          TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40, bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30.0))),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                child: TextField(
                  controller: upiIDcontroller,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  focusNode: upiIDFocusNode,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "UPI ID",
                      hintStyle:
                          TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Voice Registration",
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF999A9A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.mic,
                  color: Colors.green,
                  size: 30.0,
                ),
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: Icon(
                  Icons.radio_button_checked,
                  size: 30.0,
                ),
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: Icon(
                  Icons.radio_button_unchecked,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                    colors: signUpGradients,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text("Complete Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              registerUser(
                  nameController.value.text,
                  mobileNumberController.value.text,
                  upiIDcontroller.value.text);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return LoginVerificationScreen();
              }));
            },
          ),
        ),
        SizedBox(height: 10.0),
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
