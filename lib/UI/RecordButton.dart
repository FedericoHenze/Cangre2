import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cangre/AudioFile.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/material.dart';

import 'package:cangre/UI/ActionButton.dart';
import 'package:provider/provider.dart';


class RecordButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecordButtonState();
  }
}

class RecordButtonState extends State<RecordButton> {
  bool _isRecording = false;
  FlutterSound flutterSound = new FlutterSound();

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      action: _isRecording ? () => _stopRecordingAudio() : () => _recordAudio(),
      icon: Icon(
        _isRecording ? Icons.stop : Icons.keyboard_voice,
        size: 200,
      ),
    );
  }

  void _recordAudio() async {
    //Start recorder
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = "${tempDir.path}/audio.m4a";
    var path = await flutterSound.startRecorder(tempPath);
    final audio = Provider.of<AudioFile>(context);
    audio.stateManagementPath = tempPath;
    print('startRecorder: $path');
    setState(() {
      _isRecording = true;
    });
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Recording..."),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ));
  }

  void _stopRecordingAudio() async {
    String finalPath = await flutterSound.stopRecorder();
    print('Record stopped');
    this.setState(() {
      _isRecording = false;
    });
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Record stopped"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ));
  }
}