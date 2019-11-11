import 'package:BHIM/components/appBar.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Accounts',
        child: Container(
          child: CircleAvatar(
            radius: 17.0,
            backgroundImage: AssetImage('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Text('Accounts'),
      ),
    );
  }
}
