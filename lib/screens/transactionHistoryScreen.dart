import '../components/appBar.dart';
import '../models/transactionModel.dart';
import 'package:flutter/material.dart';

import 'transactionDetailScreen.dart';

String myID = 'shivamgoyal@upi';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Transaction History',
        child: Container(
          child: CircleAvatar(
            radius: 17.0,
            backgroundImage: AssetImage('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (BuildContext context, index) => Column(
          children: <Widget>[
            myID == transactionData[index].payerID
                ? ListTile(
                    leading: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage(transactionData[index].payeeAvatarUrl),
                        ),
                      ],
                    ),
                    title: Text(transactionData[index].payeeName),
                    subtitle: Text(transactionData[index].payeeID),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          transactionData[index].date +
                              ' • ' +
                              transactionData[index].time,
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '-' + ' ₹ ' + transactionData[index].amount,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return TransactionDetailScreen(index: index);
                      }));
                    },
                  )
                : ListTile(
                    leading: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage(transactionData[index].payerAvatarUrl),
                        ),
                      ],
                    ),
                    title: Text(transactionData[index].payerName),
                    subtitle: Text(transactionData[index].payerID),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          transactionData[index].date +
                              ' • ' +
                              transactionData[index].time,
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '+' + ' ₹ ' + transactionData[index].amount,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return TransactionDetailScreen(index: index);
                      }));
                    },
                  ),
            Divider(
              height: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
