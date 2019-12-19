import 'package:scrips_core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/authentication_service.dart';
import 'package:scrips_core/services/storage/storage_service.dart';
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
    await this.loadMainMenuItems(userId: user?.userId?.value);
    await _storageService.setLoggedInUser(this.data?.user);
    return true;
  }

  // scrips: sumeet: we keep all menu items for the user here and clone them in pmMainViewModel for each view based on it  so they are loaded only once on user login
  Future<bool> loadMainMenuItems({String userId}) async {
    //    setViewModelState(ViewState.Busy, calledFrom: 'loadMainMenuItems');
    if (userId == null || userId == '') {
      this.data.mainMenu = MainMenu();
    } else {
      debugLog('globalmodel.dart::loading menu items for $userId');
      this.data.mainMenu = await _api.getMenuItems(userId);
      debugLog(
          'Loaded Top Items: ${this.data?.mainMenu?.topItems?.length}, Bottom Items: ${this.data?.mainMenu?.bottomItems?.length}');
//      this.data.mainMenu.currentItem = this.getMenuItemForId(items: this.data.mainMenu.items, id: null);
//      for (MainMenuItem item in data.mainMenu.items) {
//        if (item.subMenu != null) {
//          item.subMenu.currentItem = this.getMenuItemForId(items: item.subMenu.items, id: null);
//        }
//      }
    }
//    setViewModelState(ViewState.Idle, calledFrom: 'loadMainMenuItems');
    debugLog(
        'globalmodel.dart::loaded ${this.data?.mainMenu?.topItems?.length} menu items for $userId');
    return true;
  }

  // ensure we don't call setBusy during build of child!!! setState() or markNeedsBuild() called during build.
  void setVars(
      {bool showOverlappedSubMenu,
      bool animateSubMenu,
      bool callSetBusy = false}) {
    debugLog('globalmodel.dart::setVars Called');
    this.data.showOverlappedSubMenu = PropertyInfo(showOverlappedSubMenu);
    this.data.animateSubMenu = PropertyInfo(animateSubMenu);
  }

  void setNewLocale(String localeCode, String localeCountry) {
    debugLog('globalmodel.dart::setNewLocale Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setNewLocale');
    // whether to show or not
    this.data.localeCode = PropertyInfo(localeCode);
    this.data.localeCountry = PropertyInfo(localeCountry);
    setViewModelState(ViewState.Idle, calledFrom: 'setNewLocale');
  }

  Future<bool> login(String userName, String password) async {
    debugLog('globalmodel.dart::login Called');
//    setViewModelState(ViewState.Busy, calledFrom: 'login');
    try {
      // whether to show or not
      LoginResponse loginResponse = await _authService.login(this.context,
          userName: userName, password: password);
      if (loginResponse.success) {
        this.data.loginMessage = PropertyInfo(loginResponse.message);
        await this.setUser(loginResponse.user);
        return true;
      } else {
        this.data.loginMessage = PropertyInfo(loginResponse.message);
        await this.setUser(User.defaults());
        return false;
      }
    } finally {
//      setViewModelState(ViewState.Idle, calledFrom: 'login');
      debugLog('globalmodel.dart::login Finished');
    }
  }

  void setLoginError(String value) {
    debugLog('globalmodel.dart::setLoginError Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setLoginError');
    try {
      // whether to show or not
      this.data.loginError.value = value;
    } finally {
      setViewModelState(ViewState.Idle, calledFrom: 'setLoginError');
      debugLog('globalmodel.dart::setLoginError Finished');
    }
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
    this.data.showOverlappedSubMenu = PropertyInfo(value);
    this.data.statusText = (this.data.showOverlappedSubMenu?.value ?? false)
        ? PropertyInfo('Showing Overlapped Menu')
        : PropertyInfo('Showing Fixed Menu');

    setViewModelState(ViewState.Idle, calledFrom: 'setShowOverlappedSubMenu');
  }

  void setShowDevicePreview(bool value) {
    debugLog('globalmodel.dart::setShowDevicePreview Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setShowDevicePreview');
    // whether to show or not
    this.data.showDevicePreview = PropertyInfo(value);
    this.data.statusText = (this.data?.showDevicePreview?.value ?? false)
        ? PropertyInfo('Showing Device Preview')
        : PropertyInfo('Not Showing Device Preview');

    setViewModelState(ViewState.Idle, calledFrom: 'setShowDevicePreview');
  }

  void setLastException(Exception exception) {
    debugLog('globalmodel.dart::setLastException Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setLastException');
    // whether to show or not
    this.data.lastException = PropertyInfo(exception);
    this.data.statusText = this.data?.lastException?.value != null
        ? PropertyInfo(this.data.lastException.toString())
        : PropertyInfo('');

    setViewModelState(ViewState.Idle, calledFrom: 'setLastException');
  }

  void setAnimateSubMenu(bool value) {
    debugLog('globalmodel.dart::setAnimateSubMenu Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setAnimateSubMenu');
    // whether to show or not
    this.data.animateSubMenu = PropertyInfo(value);
    this.data.statusText = (this.data?.animateSubMenu?.value ?? false)
        ? PropertyInfo('Showing Animated Menu')
        : PropertyInfo('Showing Non Animated Menu');

    setViewModelState(ViewState.Idle, calledFrom: 'setAnimateSubMenu');
  }

  void setStatusText(String value) {
    debugLog('globalmodel.dart::setStatusText Called');
    setViewModelState(ViewState.Busy, calledFrom: 'setStatusText');
    // whether to show or not
    this.data.statusText = PropertyInfo(value);
    setViewModelState(ViewState.Idle, calledFrom: 'setStatusText');
  }

  Future<bool> logout() async {
    setViewModelState(ViewState.Busy, calledFrom: 'logout');
    await this.setUser(null);
    setViewModelState(ViewState.Idle, calledFrom: 'logout');
    return true;
  }
}
