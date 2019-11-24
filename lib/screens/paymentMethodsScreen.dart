import 'package:flutter/material.dart';

import '../components/appBar.dart';
import 'paymentMethodScreen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Payment Methods',
        child: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(width: 0.5)),
              width: 50.0,
              height: 30.0,
              child: Image.asset('assets/images/sbi.png'),
            ),
            title: Text("State Bank of India 3090"),
            subtitle: Text('Bank Account'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PaymentMethodScreen();
              }));
            },
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(width: 0.5)),
              width: 50.0,
              height: 30.0,
              child: Image.asset('assets/images/airtel.png'),
            ),
            title: Text("Airtel Payments Bank 8994"),
            subtitle: Text('Bank Account'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PaymentMethodScreen();
              }));
            },
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(width: 0.5)),
              width: 50.0,
              height: 30.0,
              child: Image.asset('assets/images/paytm.png'),
            ),
            title: Text("Paytm Payments Bank XX94"),
            subtitle: Text('Bank Account'),
            trailing: Text('PRIMARY'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PaymentMethodScreen();
              }));
            },
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: Colors.blue)),
              width: 50.0,
              height: 30.0,
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "ADD BANK ACCOUNT",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
