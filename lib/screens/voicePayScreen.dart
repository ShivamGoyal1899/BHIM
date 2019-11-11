import 'package:BHIM/components/appBar.dart';
import 'package:flutter/material.dart';

class VoiceScreen extends StatefulWidget {
  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          title: 'Voice Pay',
          child: Container(
            child: CircleAvatar(
              radius: 17.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(
            Icons.close,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          alignment: Alignment.center,
          child: Text('Voice Pay'),
        ));
  }
}
