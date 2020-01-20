import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:BHIM/components/inputField.dart';
import 'package:BHIM/screens/RegistrationScreens/voiceRegistrationDialog.dart';
import 'package:async/async.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../global.dart';
import '../LoginScreens/loginVerificationScreen.dart';

class Register extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  Register({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  FocusNode nameFocusNode;
  FocusNode mobileNumberFocusNode;

  var _index = 0;

  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  _startRecording() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {}
    } catch (e) {
      print(e);
    }
  }

  _stopRecording() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    _uploadRecording(file);
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }

  _uploadRecording(File imageFile) async {
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse("http://192.168.137.1:5000/v1.0/audio");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        ),
        InputField(
          hintText: 'Full Name',
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: nameController,
          focusNode: nameFocusNode,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 8.0,
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "9012218994",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  Text(
                    "SIM 1 | IDEA",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  )
                ],
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 8.0,
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Not Available",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  Text(
                    "SIM 2 | NA",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 8.0,
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    nameController.value.text
                            .toLowerCase()
                            .replaceAll(' ', '') +
                        "@upi",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  Text(
                    "Auto-generated UPI ID",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
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
                    colors: blueGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text("Set Up Voice Payments",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return VoiceRegistrationDialog();
                },
              );
            },
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
              child: Text("Complete Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            onTap: () {
              if (nameController.text != '') {
                registerUser(
                  nameController.value.text,
                  "9012218994",
                  nameController.value.text.toLowerCase().replaceAll(' ', '') +
                      "@upi",
                );
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LoginVerificationScreen();
                }));
              }
            },
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
