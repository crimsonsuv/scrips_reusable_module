import 'package:flutter/material.dart';
import 'package:scrips_core/utils/utils.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  Exception _exception;

  ViewState get state => _state;

  void setViewModelState(ViewState value,
      {Exception exception, String calledFrom}) {
    debugLog(
        'SCRIPSLOG   -- BaseModel.dart::setBusy isBusy $value ${!isBlank(calledFrom) ? ' ' + calledFrom : ''}');

    _state = value;
    _exception = exception;
    notifyListeners();
  }
}

enum ViewState { Idle, Busy, Err }
