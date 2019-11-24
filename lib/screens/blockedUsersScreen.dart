import 'package:flutter/material.dart';

import '../components/appBar.dart';

class BlockedUsersScreen extends StatefulWidget {
  @override
  _BlockedUsersScreenState createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Blocked users',
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
//            title: Text("Discoverability"),
            subtitle: Text(
                'These users are blocked by you on BHIM. You will not be visible to them on BHIM app. They will also not be able to reach you.'),
            onTap: () {},
          ),
          ListTile(
            title: Text("Utkarsh Mishra"),
            trailing: Text("UNBLOCK"),
          ),
          ListTile(
            title: Text("Mankaran Singh"),
            trailing: Text("UNBLOCK"),
          ),
        ],
      ),
    );
  }
}
