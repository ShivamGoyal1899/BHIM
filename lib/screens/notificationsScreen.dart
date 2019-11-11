import 'package:BHIM/components/appBar.dart';
import 'package:BHIM/components/constant.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Notifications',
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
                "You'll continue to receive payment notfications. You can decide to block or receive other types of notifications."),
            onTap: () {},
          ),
          ListTile(
            title: Text("Tips"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Friends' Activity"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Smart Alerts"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Offers & Rewards"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Transaction History & Recommendations"),
            trailing: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text(
              "LEARN MORE",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              onPressed: null,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
