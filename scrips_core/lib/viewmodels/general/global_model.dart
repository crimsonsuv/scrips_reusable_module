import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/authentication_service.dart';
import 'package:scrips_core/services/storage/storage_service.dart';
import 'package:scrips_core/utils/utils.dart';

import '../../data_models/general/global.dart';
import '../base_model.dart';

class GlobalModel extends BaseModel {
//
  GlobalModel globalModelInstance;
  bool ready = false;
  Global data;
  BuildContext context;
  Api _api;
  StorageService _storageService;
  AuthenticationService _authService;

  GlobalModel(this.context, {@required User user})
      : data = Global(user: user ?? User.defaults()),
        this._api = Provider.of<Api>(context),
        this._storageService = Provider.of<StorageService>(context),
        this._authService = Provider.of<AuthenticationService>(context),
        super();

  Future<bool> init() async {
    debugLog('globalmodel.dart::init Called');
    // give time for async storage to load
    bool ready = await _storageService.ready();
    if (ready) {
      User savedUser = await _storageService.getLoggedInUser();
      debugLog(
          '-- globalmodel.dart::init found savedUserId: ${savedUser?.userId?.value}');
      this.setUser(savedUser);
      ready = true;
      return true;
    } else {
      debugLog('-- globalmodel.dart::init setting timeout in some ms');
      //
      Future.delayed(Duration(milliseconds: 500), init);
      return false;
    }
  }

  Future<bool> setUser(User user) async {
    this.data.user = user;
    await _storageService.setLoggedInUser(this.data?.user);
    return true;
  }

  // ensure we don't call setBusy during build of child!!! setState() or markNeedsBuild() called during build.
  void setVars(
      {bool showOverlappedSubMenu,
      bool animateSubMenu,
      bool callSetBusy = false}) {
    debugLog('globalmodel.dart::setVars Called');
    this.data.showOverlappedSubMenu = showOverlappedSubMenu;
    this.data.animateSubMenu = animateSubMenu;
  }

  void setNewLocale(String localeCode, String localeCountry) {
    debugLog('globalmodel.dart::setNewLocale Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setNewLocale');
    // whether to show or not
    this.data.localeCode = localeCode;
    this.data.localeCountry = localeCountry;
    setViewModelState(ViewState.Idle, calledFrom: 'setNewLocale');
  }

  // utility function to get current platform from places without a buildContext
  TargetPlatform getCurrentPlatform() {
    debugLog('globalmodel.dart::getCurrentPlatform Called');
    return Theme.of(context)?.platform;
  }

  void setShowOverlappedSubMenu(bool value) {
    debugLog('globalmodel.dart::setShowOverlappedSubMenu Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setShowOverlappedSubMenu');
    // whether to show or not
    this.data.showOverlappedSubMenu = value;
    this.data.statusText = (this.data.showOverlappedSubMenu ?? false)
        ? 'Showing Overlapped Menu'
        : 'Showing Fixed Menu';

    setViewModelState(ViewState.Idle, calledFrom: 'setShowOverlappedSubMenu');
  }

  void setShowDevicePreview(bool value) {
    debugLog('globalmodel.dart::setShowDevicePreview Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setShowDevicePreview');
    // whether to show or not
    this.data.showDevicePreview = value;
    this.data.statusText = (this.data?.showDevicePreview ?? false)
        ? 'Showing Device Preview'
        : 'Not Showing Device Preview';

    setViewModelState(ViewState.Idle, calledFrom: 'setShowDevicePreview');
  }

  void setLastException(Exception exception) {
    debugLog('globalmodel.dart::setLastException Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setLastException');
    // whether to show or not
    this.data.lastException = exception;
    this.data.statusText = this.data?.lastException != null
        ? this.data.lastException.toString()
        : '';

    setViewModelState(ViewState.Idle, calledFrom: 'setLastException');
  }

  void setAnimateSubMenu(bool value) {
    debugLog('globalmodel.dart::setAnimateSubMenu Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setAnimateSubMenu');
    // whether to show or not
    this.data.animateSubMenu = value;
    this.data.statusText = this.data?.animateSubMenu ?? false
        ? 'Showing Animated Menu'
        : 'Showing Non Animated Menu';

    setViewModelState(ViewState.Idle, calledFrom: 'setAnimateSubMenu');
  }

  void setStatusText(String value) {
    debugLog('globalmodel.dart::setStatusText Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setStatusText');
    // whether to show or not
    this.data.statusText = value;
    setViewModelState(ViewState.Idle, calledFrom: 'setStatusText');
  }

  Future<bool> logout() async {
    setViewModelState(ViewState.Busy, calledFrom: 'logout');
    await this.setUser(null);
    setViewModelState(ViewState.Idle, calledFrom: 'logout');
    return true;
  }
}
