import 'package:BHIM/components/inputField.dart';
import 'package:BHIM/screens/loginVerificationScreen.dart';
import 'package:BHIM/screens/RegistrationScreens/voiceRegistrationDialog.dart';
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
        InputField(
          hintText: 'Full Name',
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: nameController,
          focusNode: nameFocusNode,
        ),
        InputField(
          hintText: 'Mobile Number',
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.none,
          controller: mobileNumberController,
          focusNode: mobileNumberFocusNode,
        ),
        InputField(
          hintText: 'UPI ID',
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          controller: upiIDcontroller,
          focusNode: upiIDFocusNode,
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
                    colors: blueGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text("Enable Voice Payments",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return VoiceRegistrationDialog();
                },
              );
            },
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
                    colors: orangeGradient,
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
