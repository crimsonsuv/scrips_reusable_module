import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    debugPrint('SCRIPSLOG   -- globalmodel.dart::setBusy isBusy $value');
    _busy = value;
    notifyListeners();
  }
}
