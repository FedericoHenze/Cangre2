import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../AudioFile.dart';

class ShareButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShareButtonState();
  }
}

class ShareButtonState extends State<ShareButton> {
  String audioPath;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.share),
      onPressed: () => _share(),
    );
  }

  void _share() async {
    final audio = Provider.of<AudioFile>(context);
    File testFile = new File(audio.stateManagementPath);
    ShareExtend.share(testFile.path, "file");

    if (await testFile.exists()) {
      print('shared dialog open');
      ShareExtend.share(testFile.path, "file");
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('No record available to share'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
          });
    }
  }
}