import 'package:BHIM/screens/paymentStatusDialog.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class PaymentDialog extends StatefulWidget {
  final String intent;
  final String person;
  final String amount;

  PaymentDialog({this.intent, this.person, this.amount});

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            height: 45.0,
            child: widget.intent == 'send_money'
                ? Text(
                    'Wanna ' +
                        widget.intent.split('_')[0] +
                        ' ₹' +
                        widget.amount +
                        ' to ' +
                        widget.person +
                        '?',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    'Wanna ' +
                        widget.intent.split('_')[0] +
                        ' ₹' +
                        widget.amount +
                        ' from ' +
                        widget.person +
                        '?',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
          ),
          SizedBox(height: 30.0),
          Center(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      gradient: LinearGradient(
                          colors: orangeGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: Text("Confirm Payment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                  ),
                  onTap: () {
                    widget.intent == 'send_money'
                        ? sendMoneyTransaction(
                            widget.person,
                            '9012218994',
                            widget.amount,
                          )
                        : requestMoneyTransaction(
                            widget.person,
                            '9012218994',
                            widget.amount,
                          );
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PaymentStatusDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
