import 'package:flutter/material.dart';
import 'package:screenshot_and_share/screenshot_share.dart';

import '../components/appBar.dart';
import '../global.dart';

class TransactionDetailScreen extends StatelessWidget {
  final int index;

  TransactionDetailScreen({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Transaction Details',
        child: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 4.0,
        icon: Icon(Icons.share, size: 25),
        label: Text(
          'Share receipt',
          style: TextStyle(fontSize: 16.0),
        ),
        onPressed: () {
          ScreenshotShare.takeScreenshotAndShare();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.blue,
                  child: Text(
                    listDecryptedTransaction[index].split(',')[3][0],
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(width: 2.0),
              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 2.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.blue,
                  child: Text(
                    listDecryptedTransaction[index].split(',')[0][0],
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  '₹ ' + listDecryptedTransaction[index].split(',')[6],
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0),
                Text(
                  myID == listDecryptedTransaction[index].split(',')[1]
                      ? 'Received from'
                      : 'Paid to',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  myID == listDecryptedTransaction[index].split(',')[1]
                      ? listDecryptedTransaction[index].split(',')[3]
                      : listDecryptedTransaction[index].split(',')[0],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            leading: listDecryptedTransaction[index].split(',')[9] == 'success'
                ? IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.green))
                : listDecryptedTransaction[index].split(',')[9] == 'failed'
                    ? IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red))
                    : IconButton(
                        icon: Icon(Icons.pause_circle_filled,
                            color: Colors.blue)),
            title: Text(
                listDecryptedTransaction[index].split(',')[9] == 'success'
                    ? myID == listDecryptedTransaction[index].split(',')[1]
                        ? 'Received' +
                            ' ₹ ' +
                            listDecryptedTransaction[index].split(',')[6]
                        : 'Paid' +
                            ' ₹ ' +
                            listDecryptedTransaction[index].split(',')[6]
                    : listDecryptedTransaction[index].split(',')[9] == 'failed'
                        ? 'Transaction failed'
                        : 'Transaction pending'),
            subtitle: Text(
                listDecryptedTransaction[index].split(',')[8].split(' ')[0] +
                    ' • ' +
                    listDecryptedTransaction[index]
                        .split(',')[8]
                        .split(' ')[1]
                        .split('.')[0] +
                    ' hrs'),
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('UPI Transaction ID'),
            subtitle: Text(listDecryptedTransaction[index].split(',')[7]),
          ),
          ListTile(
            title: Text('To: ' + listDecryptedTransaction[index].split(',')[0]),
            subtitle: Text(listDecryptedTransaction[index].split(',')[1]),
          ),
          ListTile(
            title:
                Text('From: ' + listDecryptedTransaction[index].split(',')[3]),
            subtitle: Text(listDecryptedTransaction[index].split(',')[4]),
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
