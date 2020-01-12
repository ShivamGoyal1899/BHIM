import 'package:BHIM/components/inputField.dart';
import 'package:BHIM/screens/paymentStatusDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_contact_picker/native_contact_picker.dart';

import '../components/appBar.dart';
import '../global.dart';

class PaymentScreen extends StatefulWidget {
  final String intent;

  PaymentScreen({this.intent});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact;
  final upiIDcontroller = TextEditingController();
  final amountController = TextEditingController();
  FocusNode upiIDFocusNode;
  FocusNode amountFocusNode;
  bool isVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: widget.intent == 'send_money' ? 'Send Money' : 'Request Money',
        child: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 75.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      gradient: LinearGradient(
                          colors: blueGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: Text("Pick Contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                  ),
                  onTap: () async {
                    Contact contact = await _contactPicker.selectContact();
                    setState(() {
                      _contact = contact;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'OR Enter UPI ID',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              InputField(
                hintText: 'UPI ID',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                controller: upiIDcontroller,
                focusNode: upiIDFocusNode,
              ),
              InputField(
                hintText: 'Amount',
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.none,
                controller: amountController,
                focusNode: amountFocusNode,
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
              Center(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      gradient: LinearGradient(
                          colors: orangeGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: Text("Proceed",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                  ),
                  onTap: () async {
                    widget.intent == 'send_money'
                        ? sendMoneyTransaction(
                            _contact.toString().split(':')[0],
                            _contact
                                .toString()
                                .split(':')[1]
                                .replaceAll('+91', ' ')
                                .replaceAll(new RegExp(r'\s+\b|\b\s'), ''),
                            amountController.text,
                          )
                        : requestMoneyTransaction(
                            _contact.toString().split(':')[0],
                            _contact
                                .toString()
                                .split(':')[1]
                                .replaceAll('+91', ' ')
                                .replaceAll(new RegExp(r'\s+\b|\b\s'), ''),
                            amountController.text,
                          );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PaymentStatusDialog();
                      },
                    );
                    await new Future.delayed(const Duration(seconds: 3));
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
