import '../components/appBar.dart';
import '../components/constant.dart';
import '../models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:screenshot_and_share/screenshot_share.dart';
import 'transactionHistoryScreen.dart';

class TransactionDetailScreen extends StatelessWidget {
  final int index;

  TransactionDetailScreen({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Transaction Details',
        child: kBackBtn,
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
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage(transactionData[index].payerAvatarUrl),
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
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage(transactionData[index].payeeAvatarUrl),
                ),
              )
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  '₹ ' + transactionData[index].amount,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0),
                Text(
                  myID == transactionData[index].payeeID
                      ? 'Received from'
                      : 'Paid to',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  myID == transactionData[index].payeeID
                      ? transactionData[index].payerName
                      : transactionData[index].payeeName,
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
            leading: transactionData[index].transactionStatus == 'success'
                ? IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.green))
                : transactionData[index].transactionStatus == 'failed'
                    ? IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red))
                    : IconButton(
                        icon: Icon(Icons.pause_circle_filled,
                            color: Colors.blue)),
            title: Text(transactionData[index].transactionStatus == 'success'
                ? myID == transactionData[index].payeeID
                    ? 'Received' + ' ₹ ' + transactionData[index].amount
                    : 'Paid' + ' ₹ ' + transactionData[index].amount
                : transactionData[index].transactionStatus == 'failed'
                    ? 'Transaction failed'
                    : 'Transaction pending'),
            subtitle: Text(transactionData[index].date +
                ' • ' +
                transactionData[index].time),
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('UPI Transaction ID'),
            subtitle: Text(transactionData[index].transactionID),
          ),
          ListTile(
            title: Text('To: ' + transactionData[index].payeeName),
            subtitle: Text(transactionData[index].payeeID),
          ),
          ListTile(
            title: Text('From: ' + transactionData[index].payerName),
            subtitle: Text(transactionData[index].payerID),
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
