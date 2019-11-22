import 'package:cangre/AudioFile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UI/RecordButton.dart';
import 'UI/ShareButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cangre Audios',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => AudioFile(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Cangre"),
          ),
          floatingActionButton: ShareButton(),
          body: Center(
            child: Column(
              children: <Widget>[
                RecordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
