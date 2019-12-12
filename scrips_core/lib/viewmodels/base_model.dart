import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  Error _error;

  ViewState get state => _state;

  void setError(Error err) {
    _error = err;
  }

  void setViewModelState(ViewState value, {Error error, String calledFrom}) {
    _state = value;
    _error = error;
    notifyListeners();
  }
}

enum ViewState { Idle, Busy, Err }
