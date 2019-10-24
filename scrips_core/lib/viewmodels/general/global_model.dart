import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/authentication_service.dart';
//import 'package:provider/provider.dart';
//import 'package:scrips_core/services/api/api.dart';
import '../../datamodels/general/global.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class GlobalModel extends BaseModel {
  Global data;
  final BuildContext context;
  Api _api;
  AuthenticationService _authService;

  GlobalModel(this.context, {String userId})
      : data = Global(userId: userId),
        this._api = Provider.of<Api>(context),
        this._authService = Provider.of<AuthenticationService>(context),
        super();

  void init() {}
  void setVars({bool showOverlappedSubMenu, bool animateSubMenu, bool callSetBusy = false}) {
    if (callSetBusy) {
      setBusy(true);
    }
    this.data.showOverlappedSubMenu = showOverlappedSubMenu;
    this.data.animateSubMenu = animateSubMenu;
    if (callSetBusy) {
      setBusy(false);
    }
  }

  void setShowOverlappedSubMenu(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.showOverlappedSubMenu = value;
    this.data.statusText = this.data.showOverlappedSubMenu ? 'Showing Overlapped Menu' : 'Showing Fixed Menu';

    setBusy(false);
  }

  void setShowDevicePreview(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.showDevicePreview = value;
    this.data.statusText = this.data.showDevicePreview ? 'Showing Device Preview' : 'Not Showing Device Preview';

    setBusy(false);
  }

  void setLastException(Exception exception) {
    setBusy(true);
    // whether to show or not
    this.data.lastException = exception;
    this.data.statusText = this.data.lastException != null ? this.data.lastException.toString() : '';

    setBusy(false);
  }

  void setAnimateSubMenu(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.animateSubMenu = value;
    this.data.statusText = this.data.animateSubMenu ? 'Showing Animated Menu' : 'Showing Non Animated Menu';

    setBusy(false);
  }

  void setStatusText(String value) {
    setBusy(true);
    // whether to show or not
    this.data.statusText = value;
    setBusy(false);
  }

  void setNewLocale(String localeCode, String localeCountry) {
    setBusy(true);
    // whether to show or not
    this.data.localeCode = localeCode;
    this.data.localeCountry = localeCountry;
    setBusy(false);
  }

  Future<bool> login(String userName, String password) async {
    setBusy(true);
    try {
      // whether to show or not
      LoginResponse loginResponse = await _authService.login(this.context, userName: userName, password: password);
      if (loginResponse.success) {
        this.data.userId = loginResponse.userId;
        this.data.loginMessage = loginResponse.message;

        return true;
      } else {
        this.data.userId = '';
        this.data.loginMessage = loginResponse.message;
        return false;
      }
    } finally {
      setBusy(false);
    }
  }
}

class ContainedItem extends StatelessWidget {
  final String suffix;
  //
  ContainedItem({Key key, this.suffix}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label $suffix-1',
          textValue: 'Contained Text $suffix-1',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label $suffix-2',
          textValue: 'Contained Text $suffix-2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label $suffix-3',
          textValue: 'Contained Text $suffix-3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}
