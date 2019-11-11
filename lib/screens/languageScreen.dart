import 'package:BHIM/components/appBar.dart';
import 'package:BHIM/components/constant.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Change Language',
        child: kBackBtn,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "English",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
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
            title: Text("Hindi"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Bengali"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Gujarati"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Punjabi"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Kannada"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Marathi"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Tamil"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Telugu"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
