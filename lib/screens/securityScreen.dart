import '../components/appBar.dart';
import '../components/constant.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Security',
        child: kBackBtn,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Use Fingerprint"),
            subtitle: Text('Fingerprint set in your phone\'s settings'),
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
            title: Text("Use BHIM PIN"),
            subtitle: Text('4-digit offline PIN protecting BHIM UPI App'),
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
            title: Text("Use Face Unlock"),
            subtitle: Text('Face ID set in your phone\'s settings'),
            trailing: Text('UNAVAILABLE'),
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
