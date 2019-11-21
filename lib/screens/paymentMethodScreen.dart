import '../components/appBar.dart';
import '../components/constant.dart';
import 'qrFullScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Payment Method',
        child: kBackBtn,
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
            trailing: Text('PRIMARY'),
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text("Account information"),
            subtitle: Text('Shivam Goyal' + ' • ' + '9012218994'),
            onTap: () {},
          ),
          ListTile(
            title: Text("UPI ID"),
            subtitle: Text('9012218994@upi'),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.qrcode,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "DISPLAY QR CODE",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return QRFullScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
            title: Text(
              'FORGOT UPI PIN',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.blue,
              ),
            ),
            title: Text(
              'VIEW BALANCE',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
