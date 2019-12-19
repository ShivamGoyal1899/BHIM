import 'package:flutter/material.dart';

import '../components/appBar.dart';
import '../global.dart';
import 'transactionDetailScreen.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

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
      body: FutureBuilder(
        future: getAllTransactions(),
        builder: (context, snapshot) {
          if (listDecryptedTransaction.isNotEmpty) {
            return ListView.builder(
              itemCount: listDecryptedTransaction.length,
              itemBuilder: (BuildContext context, index) => Column(
                children: <Widget>[
                  myID == listDecryptedTransaction[index].split(',')[4]
                      ? ListTile(
                          leading: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  listDecryptedTransaction[index].split(',')[0]
                                      [0],
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                              listDecryptedTransaction[index].split(',')[0]),
                          subtitle: Text(
                              listDecryptedTransaction[index].split(',')[1]),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                listDecryptedTransaction[index]
                                        .split(',')[8]
                                        .split(' ')[0] +
                                    ' • ' +
                                    listDecryptedTransaction[index]
                                        .split(',')[8]
                                        .split(' ')[1]
                                        .split('.')[0] +
                                    ' hrs',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              Text(
                                '-' +
                                    ' ₹ ' +
                                    listDecryptedTransaction[index]
                                        .split(',')[6],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
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
                                backgroundColor: Colors.blue,
                                child: Text(
                                  listDecryptedTransaction[index].split(',')[3]
                                      [0],
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                              listDecryptedTransaction[index].split(',')[3]),
                          subtitle: Text(
                              listDecryptedTransaction[index].split(',')[4]),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                listDecryptedTransaction[index]
                                        .split(',')[8]
                                        .split(' ')[0] +
                                    ' • ' +
                                    listDecryptedTransaction[index]
                                        .split(',')[8]
                                        .split(' ')[1]
                                        .split('.')[0] +
                                    ' hrs',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              Text(
                                '+' +
                                    ' ₹ ' +
                                    listDecryptedTransaction[index]
                                        .split(',')[6],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return TransactionDetailScreen(index: index);
                            }));
                          },
                        ),
                  Divider(
                    height: 0.0,
                  ),
                ],
              ),
            );
          }
          return Center(child: Image.asset('assets/images/loading.gif'));
        },
      ),
    );
  }
}
