import 'package:flutter/foundation.dart';

class AudioFile with ChangeNotifier {

  String _stateManagementPath = "";

  String get stateManagementPath => _stateManagementPath;

  set stateManagementPath(String path) {
    _stateManagementPath = path;
    notifyListeners();
  }

}