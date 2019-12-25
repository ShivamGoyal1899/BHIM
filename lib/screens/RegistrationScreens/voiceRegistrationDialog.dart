import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoiceRegistrationDialog extends StatefulWidget {
  final String intent;
  final String person;
  final String amount;

  VoiceRegistrationDialog({this.intent, this.person, this.amount});

  @override
  _VoiceRegistrationDialogState createState() =>
      _VoiceRegistrationDialogState();
}

class _VoiceRegistrationDialogState extends State<VoiceRegistrationDialog> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Voice Registration',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Hold mic & Speak',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '"Hello BHIM"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic),
              ),
              GestureDetector(
                onLongPressUp: () {
                  setState(() {
                    status1 = true;
                  });
                },
                child: IconButton(
                  icon: status1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.mic_none),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '"Namaste BHIM"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic),
              ),
              GestureDetector(
                onLongPressUp: () {
                  setState(() {
                    status2 = true;
                  });
                },
                child: IconButton(
                  icon: status2
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.mic_none),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '"Hey BHIM"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic),
              ),
              GestureDetector(
                onLongPressUp: () async {
                  setState(() {
                    status3 = true;
                  });
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
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
                            'assets/images/loading.gif',
                            height: 50,
                          ),
                          Text(
                            '  Verifying Voice !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 3));
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
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
                            'Verified !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: IconButton(
                  icon: status3
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.mic_none),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
