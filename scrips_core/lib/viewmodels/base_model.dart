import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  Exception _exception;

  ViewState get state => _state;

  void setViewModelState(ViewState value,
      {Exception exception, String calledFrom}) {
    _state = value;
    _exception = exception;
    notifyListeners();
  }
}

enum ViewState { Idle, Busy, Err }
