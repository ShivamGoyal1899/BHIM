import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recase/recase.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../global.dart';
import '../models/intentApiModel.dart';
import '../models/languageModel.dart';
import 'RegistrationScreens/registrationScreen.dart';
import 'languageScreen.dart';
import 'paymentDialog.dart';
import 'paymentMethodScreen.dart';
import 'paymentMethodsScreen.dart';
import 'paymentScreen.dart';
import 'qrFullScreen.dart';
import 'rewardzScreen.dart';
import 'settingsScreen.dart';
import 'transactionHistoryScreen.dart';
import 'ussdServiceScreen.dart';

class VoicePay extends StatefulWidget {
  @override
  _VoicePayState createState() => _VoicePayState();
}

class _VoicePayState extends State<VoicePay> {
  String transcription = 'Tap on mic to VoicePay';
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  LanguageModel selectedLang = languageData[0];

  String myIntent;
  var myIntentConfidence;
  String myAmountDetected = 'NULL';
  String myPerson = 'NULL';

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
//    _speech.setErrorHandler(errorHandler);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  getIntent() async {
    print(
        '\n\n\n\n\n----------------------------- Transcription --------------------------------\n' +
            transcription);
    print(
        '----------------------------------------------------------------------------\n\n');
    String url = 'http://3.83.153.83:5005/model/parse';
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"text": transcription};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    http.Response response = await http.post(url,
        headers: headers, body: jsonBody, encoding: encoding);
    IntentApi parsedResponse = IntentApi.fromJson(json.decode(response.body));
    myIntent = parsedResponse.intent.name;
    myIntentConfidence = parsedResponse.intent.confidence.toString();
    if (parsedResponse.entities.length == 2) {
      if (parsedResponse.entities[0].entity == 'amount') {
        myAmountDetected = parsedResponse.entities[0].value;
      } else if (parsedResponse.entities[1].entity == 'amount') {
        myAmountDetected = parsedResponse.entities[1].value;
      }
      if (parsedResponse.entities[0].entity == 'name') {
        myPerson = ReCase(parsedResponse.entities[0].value).titleCase;
      } else if (parsedResponse.entities[1].entity == 'name') {
        myPerson = ReCase(parsedResponse.entities[1].value).titleCase;
      }
    }
    print(
        '---------------------------- Intent Detected -------------------------------\n' +
            myIntent);
    print(
        '----------------------------------------------------------------------------\n\n');
    print(
        '--------------------------- Intent Confidence ------------------------------\n' +
            myIntentConfidence);
    print(
        '----------------------------------------------------------------------------\n\n');
    print(
        '---------------------------- Amount Detected -------------------------------\n' +
            myAmountDetected);
    print(
        '----------------------------------------------------------------------------\n\n');
    print(
        '---------------------------- Person Detected -------------------------------\n' +
            myPerson);
    print(
        '----------------------------------------------------------------------------\n\n\n\n\n');
    navigate();
  }

  navigate() {
    if (double.parse(myIntentConfidence) >= 0.6) {
      if (myIntent == 'check_balance') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return PaymentMethodScreen();
        }));
      } else if (myIntent == 'check_transfer_history') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return TransactionHistoryScreen();
        }));
      } else if (myIntent == 'check_rewards') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return RewardzScreen();
        }));
      } else if (myIntent == 'send_money' || myIntent == 'request_money') {
        if (myAmountDetected != 'NULL' && myPerson != 'NULL') {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PaymentDialog(
                  intent: myIntent, person: myPerson, amount: myAmountDetected);
            },
          );
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return PaymentScreen(
              intent: myIntent,
            );
          }));
        }
      } else if (myIntent == 'scan') {
        scan();
      } else if (myIntent == 'receive_money') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return QRFullScreen();
        }));
      }
    } else if (transcription.contains('accounts')) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return PaymentMethodsScreen();
      }));
    } else if (transcription.contains('language')) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return LanguageScreen();
      }));
    } else if (transcription.contains('USSD')) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return USSDServiceScreen();
      }));
    } else if (transcription.contains('deregister')) {
      deregisterUser();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return RegistrationScreen();
      }));
    } else if (transcription.contains('settings')) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return SettingsScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: Text(
        'VoicePay',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _isListening
              ? Image.asset('assets/images/listening.gif')
              : Image.asset('assets/images/listening.jpg'),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            height: 45.0,
            child: Text(
              transcription,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard),
                onPressed: () {},
              ),
              IconButton(
                icon: !_speechRecognitionAvailable || _isListening
                    ? Icon(
                        Icons.mic,
                        size: 25,
                      )
                    : Icon(
                        Icons.mic_none,
                        size: 25,
                      ),
                onPressed: _speechRecognitionAvailable && !_isListening
                    ? () => start()
                    : null,
              ),
              IconButton(
                icon: Icon(Icons.translate),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: 350.0,
                        child: ListView.builder(
                          itemCount: languageData.length + 1,
                          itemBuilder: (context, index) => index == 0
                              ? Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        'Choose Language',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Divider(
                                      height: 0.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              : ListTile(
                                  title: Text(
                                      languageData[index - 1].languageName),
                                  trailing:
                                      languageData[index - 1].languageCode ==
                                              'en_IN'
                                          ? IconButton(
                                              icon: Icon(
                                                Icons.check,
                                                color: Colors.black,
                                              ),
                                              onPressed: null,
                                            )
                                          : null),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void start() => _speech.listen(locale: selectedLang.languageCode);

//      .then((result) => print('_MyAppState.start => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
//    print('_MyAppState.onCurrentLocale... $locale');
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) {
    setState(() => transcription = text);
  }

  void onRecognitionComplete() async {
    setState(() {
      return _isListening = false;
    });
    await Future.delayed(Duration(seconds: 2));
    getIntent();
  }

  void errorHandler() => activateSpeechRecognizer();
}
