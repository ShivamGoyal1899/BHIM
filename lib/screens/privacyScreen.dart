import 'package:flutter/material.dart';

import '../components/appBar.dart';
import 'blockedUsersScreen.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Privacy',
        child: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Discoverability"),
            subtitle: Text(
                'Enable people with your mobile number to find you on BHIM UPI'),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text("Blocked Users"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return BlockedUsersScreen();
              }));
            },
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
