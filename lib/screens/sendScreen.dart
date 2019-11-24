import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_contact_picker/native_contact_picker.dart';

import '../components/appBar.dart';

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact;
  final controller = TextEditingController();
  FocusNode myFocusNode;
  bool isVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Send Money',
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () async {
                Contact contact = await _contactPicker.selectContact();
                setState(() {
                  _contact = contact;
                });
//                  if (_contact != null) {
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(builder: (BuildContext context) {
//                      return VerifiedSendScreen();
//                    }));
//                  }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.contacts,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      '  Pick Contact',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            Text(
              'OR Enter UPI ID',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              focusNode: myFocusNode,
              autofocus: false,
              obscureText: false,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'UPI ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
            SizedBox(height: 20.0),
            _contact == null
                ? Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      title: Text('No Contact Selected'),
                    ),
                  )
                : Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
//                        backgroundImage: AssetImage('assets/images/shivam.jpg'),
                        backgroundColor: Colors.blue,
                        child: Text(
                          _contact.toString()[0],
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      title: Text(_contact.toString().split(':')[0]),
                      subtitle: Text(_contact
                          .toString()
                          .split(':')[1]
                          .replaceAll('+91', ' ')
                          .replaceAll(new RegExp(r'\s+\b|\b\s'), '')),
                    ),
                  ),
            SizedBox(height: 20.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.verified_user,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      ' Proceed to Pay',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
