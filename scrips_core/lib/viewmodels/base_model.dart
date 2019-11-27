import 'package:scrips_core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/utils/utils.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value, {String calledFrom}) {
    debugLog(
        '-- BaseModel.dart::setBusy isBusy $value ${!isBlank(calledFrom) ? ' ' + calledFrom : ''}');
    _busy = value;
    notifyListeners();
  }

  dynamic init() {}
}
