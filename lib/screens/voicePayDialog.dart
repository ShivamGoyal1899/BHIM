import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speech_recognition/speech_recognition.dart';

import '../global.dart';
import '../models/intentApiModel.dart';
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

const languages = const [
  const Language('English (India)', 'en'),
  const Language('Hindi (हिंदी)', 'hi'),
  const Language('Marathi (मराठी)', 'mr'),
  const Language('Gujarati (ગુજરાતી)', 'gu'),
  const Language('Kannada (ಕನ್ನಡ)', 'kn'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class VoicePay extends StatefulWidget {
  @override
  _VoicePayState createState() => _VoicePayState();
}

class _VoicePayState extends State<VoicePay> {
  String transcription = 'Tap on mic to VoicePay';
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String myIntent;
  var myIntentConfidence;
  String myAmountDetected = 'NULL';
  String myPerson = 'NULL';

  Language selectedLang = languages[0];

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
    String url = 'http://3.83.153.83:5000/v1.0/nlp';
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      "language_code": selectedLang.code,
      "text": transcription
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    http.Response response = await http.post(url,
        headers: headers, body: jsonBody, encoding: encoding);
    IntentApi parsedResponse = IntentApi.fromJson(json.decode(response.body));
    myIntent = parsedResponse.intent;
    myIntentConfidence = parsedResponse.confidence.toString();
    myAmountDetected = parsedResponse.amount ?? 'NULL';
    myPerson = parsedResponse.name ?? 'NULL';
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
    if (double.parse(myIntentConfidence) >= 0.7) {
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
                icon: Icon(
                  Icons.help_outline,
                  size: 25,
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      title: Text(
                        'VoicePay Help',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25.0),
                      ),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 80.0,
                              child: Text(
                                'VoicePay allows the user to do financial transactions and navigate throurgh the BHIM App by making use of simple voice commands.',
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Divider(height: 20.0, color: Colors.grey),
                            Container(
                              alignment: Alignment.center,
                              height: 20.0,
                              child: Text(
                                'Sample Commands',
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Divider(height: 20.0, color: Colors.grey),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 20.0,
                              child: Text(
                                'Send 500 Rupees to Mankaran Singh',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 20.0,
                              child: Text(
                                'Show my Transaction History',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 20.0,
                              child: Text(
                                'Request 250 Rupees from Utkarsh Mishra',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 20.0,
                              child: Text(
                                'I want to change some Settings',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 20.0,
                              child: Text(
                                'Show the Rewardz I have earned.',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ]),
                    );
                  },
                ),
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
              PopupMenuButton<Language>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                icon: Icon(Icons.translate),
                onSelected: (lang) {
                  setState(() => selectedLang = lang);
                },
                itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
                color: Colors.white,
                elevation: 8.0,
                initialValue: selectedLang,
                offset: Offset.zero,
                enabled: true,
              ),
            ],
          ),
          Divider(height: 20.0, color: Colors.grey),
          Container(
            alignment: Alignment.bottomCenter,
            height: 20.0,
            child: Text(
              'Send 500 Rupees to Mankaran Singh',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 20.0,
            child: Text(
              'Show my Transaction History',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<PopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => PopupMenuItem<Language>(
            value: l,
            child: Text(l.name),
          ))
      .toList();

  void _selectLangHandler(lang) {
    setState(() => selectedLang = lang);
  }

  void start() => _speech
      .listen(locale: 'en_IN')
      .then((result) => print('_MyAppState.start => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
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
