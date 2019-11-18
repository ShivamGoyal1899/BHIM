import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../models/languageModel.dart';

const languages = const [
  const Language('Hindi', 'hi_HI'),
  const Language('English IN', 'en_IN'),
  const Language('English US', 'en_US'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
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
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = 'Tap on mic to VoicePay';

  Language selectedLang = languages.first;

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
              PopupMenuButton<Language>(
                icon: Icon(Icons.translate),
                onSelected: _selectLangHandler,
                itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
              ),
//              IconButton(
//                icon: Icon(Icons.translate),
//                onPressed: () {
//                  showModalBottomSheet<void>(
//                    context: context,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(25),
//                        topRight: Radius.circular(25),
//                      ),
//                    ),
//                    builder: (BuildContext context) {
//                      return Container(
//                        height: 350.0,
//                        child: ListView.builder(
//                          itemCount: languageData.length + 1,
//                          itemBuilder: (context, index) => index == 0
//                              ? Column(
//                                  children: <Widget>[
//                                    ListTile(
//                                      title: Text(
//                                        'Choose Language',
//                                        style: TextStyle(
//                                          fontWeight: FontWeight.w700,
//                                        ),
//                                        textAlign: TextAlign.center,
//                                      ),
//                                    ),
//                                    Divider(
//                                      height: 0.0,
//                                      color: Colors.black,
//                                    ),
//                                  ],
//                                )
//                              : ListTile(
//                                  title: Text(
//                                      languageData[index - 1].languageName),
//                                  trailing:
//                                      languageData[index - 1].languageCode ==
//                                              'en_IN'
//                                          ? IconButton(
//                                              icon: Icon(
//                                                Icons.check,
//                                                color: Colors.black,
//                                              ),
//                                              onPressed: null,
//                                            )
//                                          : null),
//                        ),
//                      );
//                    },
//                  );
//                },
//              ),
            ],
          ),
        ],
      ),
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => new CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: new Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({String label, VoidCallback onPressed}) => new Padding(
      padding: new EdgeInsets.all(12.0),
      child: new RaisedButton(
        color: Colors.cyan.shade600,
        onPressed: onPressed,
        child: new Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ));

  void start() => _speech
      .listen(locale: selectedLang.code)
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
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);

  void errorHandler() => activateSpeechRecognizer();
}
