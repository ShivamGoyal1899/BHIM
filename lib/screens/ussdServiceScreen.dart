import 'package:BHIM/components/appBar.dart';
import 'package:BHIM/components/constant.dart';
import 'package:flutter/material.dart';

class USSDServiceScreen extends StatefulWidget {
  @override
  _USSDServiceScreenState createState() => _USSDServiceScreenState();
}

class _USSDServiceScreenState extends State<USSDServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'USSD Service',
        child: kBackBtn,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            subtitle: Text(
                "Using *99# service, a user can access financial services by dialing *99# frim his/her mobile registered with the bank."),
            onTap: () {},
          ),
          ListTile(
            title: Text("Toggle USSD Service"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
