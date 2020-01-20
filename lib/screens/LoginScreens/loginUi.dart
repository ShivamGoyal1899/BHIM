import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:BHIM/screens/DrawerScreens/navigationHomeScreen.dart';
import 'package:async/async.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

import '../../global.dart';

class Login extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  Login({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> status = ['pending'];

  Recording _recording = Recording();
  bool _isRecording = false;
  Random random = Random();
  TextEditingController _controller = TextEditingController();

  _startRecording(i) async {
    try {
      setState(() {
        status[i] = 'running';
      });
      _controller.text =
          'shivamgoyal@upi' + '__test' + '__' + randomNumeric(10).toString();
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
          _recording = Recording(path: "");
          _isRecording = isRecording;
        });
      } else {}
    } catch (e) {
      print(e);
    }
  }

  _stopRecording(i) async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print(" File length: ${await file.length()}");
    _uploadRecording(file, i);
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }

  _uploadRecording(File audioFile, i) async {
    var stream = http.ByteStream(DelegatingStream.typed(audioFile.openRead()));
    var length = await audioFile.length();

    var uri = Uri.parse("https://radiant32.pythonanywhere.com/v1.0/audio");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(audioFile.path));

    request.files.add(multipartFile);

    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      if (value == 'OK')
        setState(() {
          status[i] = 'success';
        });
      else
        setState(() {
          status[i] = 'failure';
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Voice Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    _startRecording(0);
                    await Future.delayed(Duration(seconds: 2));
                    _stopRecording(0);
                  },
                  child: status[0] == 'pending'
                      ? Icon(
                          Icons.mic,
                          color: Colors.blue,
                          size: 50,
                        )
                      : status[0] == 'running'
                          ? Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            )
                          : status[0] == 'success'
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 50,
                                )
                              : Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 50,
                                ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Tap mic & Speak',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '"Hey BHIM"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    gradient: LinearGradient(
                        colors: blueGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Text("Verify and Proceed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                ),
                onTap: () {
                  if (status[0] == 'success') {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return NavigationHomeScreen();
                    }));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
