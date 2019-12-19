import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/appBar.dart';
import '../global.dart';

class SecurityDashBoard extends StatefulWidget {
  @override
  _SecurityDashBoardState createState() => _SecurityDashBoardState();
}

class _SecurityDashBoardState extends State<SecurityDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Security Dashboard',
        child: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () {
                sendMoneyTransaction('Dummy Name', '9999999999', '9999');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      '  Send Transaction  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () {
                getAllTransactions();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      '  Get Transaction  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () {
                setState(() {
                  myHash = '';
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.restore,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      '  Reset Hash',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
