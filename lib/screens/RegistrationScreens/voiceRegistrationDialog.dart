import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

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

class VoiceRegistrationDialog extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  VoiceRegistrationDialog({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _VoiceRegistrationDialogState createState() =>
      _VoiceRegistrationDialogState();
}

class _VoiceRegistrationDialogState extends State<VoiceRegistrationDialog> {
  List<String> status = ['pending', 'pending', 'pending'];

  Recording _recording = Recording();
  bool _isRecording = false;
  Random random = Random();
  TextEditingController _controller = TextEditingController();

  _startRecording(i) async {
    try {
      setState(() {
        status[i] = 'running';
      });
      _controller.text = 'shivamgoyal@upi' +
          '__train-' +
          i.toString() +
          '__' +
          randomNumeric(10).toString();
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
    return AlertDialog(
      title: Text(
        'Voice Payments',
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
                'Tap mic & Speak',
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
                '"Hey BHIM"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic),
              ),
              GestureDetector(
                child: IconButton(
                  icon: status[0] == 'pending'
                      ? Icon(Icons.mic, color: Colors.blue)
                      : status[0] == 'running'
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : status[0] == 'success'
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.cancel, color: Colors.red),
                  onPressed: () async {
                    _startRecording(0);
                    await Future.delayed(Duration(seconds: 2));
                    _stopRecording(0);
                  },
                ),
              ),
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
                child: IconButton(
                  icon: status[1] == 'pending'
                      ? Icon(Icons.mic, color: Colors.blue)
                      : status[1] == 'running'
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : status[1] == 'success'
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.cancel, color: Colors.red),
                  onPressed: () async {
                    _startRecording(1);
                    await Future.delayed(Duration(seconds: 2));
                    _stopRecording(1);
                  },
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
                child: IconButton(
                  icon: status[2] == 'pending'
                      ? Icon(Icons.mic, color: Colors.blue)
                      : status[2] == 'running'
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : status[2] == 'success'
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.cancel, color: Colors.red),
                  onPressed: () async {
                    _startRecording(2);
                    await Future.delayed(Duration(seconds: 2));
                    _stopRecording(2);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Center(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 3,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  gradient: LinearGradient(
                      colors: blueGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Text("Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
