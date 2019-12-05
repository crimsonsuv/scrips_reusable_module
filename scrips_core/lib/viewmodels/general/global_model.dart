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
    debugLog('globalmodel.dart::loading menu items for $userId');
    setBusy(true, calledFrom: 'loadMainMenuItems');
    if (userId == null || userId == '') {
      this.data.mainMenu = MainMenu();
    } else {
      this.data.mainMenu = await _api.getMenuItems(userId);
//      this.data.mainMenu.currentItem = this.getMenuItemForId(items: this.data.mainMenu.items, id: null);
//      for (MainMenuItem item in data.mainMenu.items) {
//        if (item.subMenu != null) {
//          item.subMenu.currentItem = this.getMenuItemForId(items: item.subMenu.items, id: null);
//        }
//      }
    }
    setBusy(false, calledFrom: 'loadMainMenuItems');
    debugLog(
        'globalmodel.dart::loaded ${this.data?.mainMenu?.items?.length} menu items for $userId');
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
    setBusy(true, calledFrom: 'setNewLocale');
    // whether to show or not
    this.data.localeCode = PropertyInfo(localeCode);
    this.data.localeCountry = PropertyInfo(localeCountry);
    setBusy(false, calledFrom: 'setNewLocale');
  }

  Future<bool> login(String userName, String password) async {
    debugLog('globalmodel.dart::login Called');
    setBusy(true, calledFrom: 'login');
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
      setBusy(false, calledFrom: 'login');
      debugLog('globalmodel.dart::login Finished');
    }
  }

  void setLoginError(String value) {
    debugLog('globalmodel.dart::setLoginError Called');
    setBusy(true, calledFrom: 'setLoginError');
    try {
      // whether to show or not
      this.data.loginError.value = value;
    } finally {
      setBusy(false, calledFrom: 'setLoginError');
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
    setBusy(true, calledFrom: 'setShowOverlappedSubMenu');
    // whether to show or not
    this.data.showOverlappedSubMenu = PropertyInfo(value);
    this.data.statusText = (this.data.showOverlappedSubMenu?.value ?? false)
        ? PropertyInfo('Showing Overlapped Menu')
        : PropertyInfo('Showing Fixed Menu');

    setBusy(false, calledFrom: 'setShowOverlappedSubMenu');
  }

  void setShowDevicePreview(bool value) {
    debugLog('globalmodel.dart::setShowDevicePreview Called');
    setBusy(true, calledFrom: 'setShowDevicePreview');
    // whether to show or not
    this.data.showDevicePreview = PropertyInfo(value);
    this.data.statusText = (this.data?.showDevicePreview?.value ?? false)
        ? PropertyInfo('Showing Device Preview')
        : PropertyInfo('Not Showing Device Preview');

    setBusy(false, calledFrom: 'setShowDevicePreview');
  }

  void setLastException(Exception exception) {
    debugLog('globalmodel.dart::setLastException Called');
    setBusy(true, calledFrom: 'setLastException');
    // whether to show or not
    this.data.lastException = PropertyInfo(exception);
    this.data.statusText = this.data?.lastException?.value != null
        ? PropertyInfo(this.data.lastException.toString())
        : PropertyInfo('');

    setBusy(false, calledFrom: 'setLastException');
  }

  void setAnimateSubMenu(bool value) {
    debugLog('globalmodel.dart::setAnimateSubMenu Called');
    setBusy(true, calledFrom: 'setAnimateSubMenu');
    // whether to show or not
    this.data.animateSubMenu = PropertyInfo(value);
    this.data.statusText = (this.data?.animateSubMenu?.value ?? false)
        ? PropertyInfo('Showing Animated Menu')
        : PropertyInfo('Showing Non Animated Menu');

    setBusy(false, calledFrom: 'setAnimateSubMenu');
  }

  void setStatusText(String value) {
    debugLog('globalmodel.dart::setStatusText Called');
    setBusy(true, calledFrom: 'setStatusText');
    // whether to show or not
    this.data.statusText = PropertyInfo(value);
    setBusy(false, calledFrom: 'setStatusText');
  }

  Future<bool> logout() async {
    setBusy(true, calledFrom: 'logout');
    await this.setUser(null);
    setBusy(false, calledFrom: 'logout');
    return true;
  }
}
