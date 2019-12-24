import 'package:flutter/material.dart';

class PaymentStatusDialog extends StatefulWidget {
  final String intent;
  final String person;
  final String amount;

  PaymentStatusDialog({this.intent, this.person, this.amount});

  @override
  _PaymentStatusDialogState createState() => _PaymentStatusDialogState();
}

class _PaymentStatusDialogState extends State<PaymentStatusDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/payment.gif',
            height: 50,
          ),
          Text(
            'Success !',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
