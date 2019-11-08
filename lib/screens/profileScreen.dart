import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _lights = true;

  _launchUrlIssue() async {
    const url =
        'mailto:dev@bhimupi.org.in/?subject=Report%20Issue%20with%20BHIM%20UPI%20App';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrlWebsite() async {
    const url = 'https://www.bhimupi.org.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            alignment: Alignment.center,
            child: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage:
                  NetworkImage('https://ieitiet.co/images/avatars/shivam.jpg'),
              radius: 60.0,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Shivam Goyal',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  '9012218994@upi',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(height: 40.0),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                _lights = !_lights;
              });
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Your Rewardz",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Coming Soon",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16.0,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Rewardz"),
                    content: Text("Coming Soon"),
                  );
                },
              );
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Language",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "English",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16.0,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Language"),
                    content: Text(
                        "Currently, BHIM UPI app is only available in English(IN) only. More languages will be added soon."),
                  );
                },
              );
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "Report Issue",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Report Issue"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                            "If you are facing any issue while using BHIM UPI App, please mail us over.\n"),
                        GestureDetector(
                          child: Text(
                            "dev@bhimupi.org.in",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            _launchUrlIssue();
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Divider(
              height: 0.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            title: Text(
              "About BHIM UPI",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("About BHIM UPI"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                            "Bharat Interface for Money (BHIM) is a payment app that lets you make simple, easy and quick transactions using Unified Payments Interface (UPI). You can make direct bank payments to anyone on UPI using their UPI ID or scanning their QR with the BHIM app. You can also request money through the app from a UPI ID.\n\nPioneered and developed by National Payments Corporation of India (NPCI), BHIM has been conceived and launched by the Hon'ble Prime Minister of India, Narendra Modi on 30th December 2016 to bring in Financial Inclusion to the nation and a digitally empowered society."),
                        GestureDetector(
                          child: Text(
                            "\nVisit BHIM UPI Website",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            _launchUrlWebsite();
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
