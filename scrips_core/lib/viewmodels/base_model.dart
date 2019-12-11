import 'package:scrips_core/utils/utils.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setViewModelState(ViewState value, {String calledFrom}) {
    _state = value;
    notifyListeners();
  }

}

enum ViewState { Idle, Busy, Err }