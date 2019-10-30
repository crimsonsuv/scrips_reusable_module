import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/authentication_service.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

import '../../datamodels/general/global.dart';
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
      : data = Global(user: user),
        this._api = Provider.of<Api>(context),
        this._storageService = Provider.of<StorageService>(context),
        this._authService = Provider.of<AuthenticationService>(context),
        super();

  Future<bool> init() async {
    debugPrint('SCRIPSLOG globalmodel.dart::init Called');
    // give time for async storage to load
    bool ready = await _storageService.ready();
    if (ready) {
      User savedUser = await _storageService.getLoggedInUser();
      debugPrint('SCRIPSLOG   -- globalmodel.dart::init found savedUserId: ${savedUser?.userId?.value}');
      this.setUser(savedUser);
      ready = true;
      return true;
    } else {
      debugPrint('SCRIPSLOG   -- globalmodel.dart::init setting timeout in some ms');
      //
      Future.delayed(Duration(milliseconds: 500), init);
      return false;
    }
  }

  Future<bool> setUser(User user) async {
    this.data.user = user;
    await this.loadMainMenuItems(userId: user?.userId?.value);
    _storageService.setLoggedInUser(this.data.user);
    return true;
  }

  // scrips: sumeet: we keep all menu items for the user here and clone them in pmMainViewModel for each view based on it  so they are loaded only once on user login
  Future<bool> loadMainMenuItems({String userId}) async {
    debugPrint('SCRIPSLOG globalmodel.dart::loading menu items for $userId');
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
    return true;
  }

  // ensure we don't call setBusy during build of child!!! setState() or markNeedsBuild() called during build.
  void setVars({bool showOverlappedSubMenu, bool animateSubMenu, bool callSetBusy = false}) {
    debugPrint('SCRIPSLOG globalmodel.dart::setVars Called');
    this.data.showOverlappedSubMenu = showOverlappedSubMenu;
    this.data.animateSubMenu = animateSubMenu;
  }

  void setNewLocale(String localeCode, String localeCountry) {
    debugPrint('SCRIPSLOG globalmodel.dart::setNewLocale Called');
    setBusy(true);
    // whether to show or not
    this.data.localeCode = localeCode;
    this.data.localeCountry = localeCountry;
    setBusy(false);
  }

  Future<bool> login(String userName, String password) async {
    debugPrint('SCRIPSLOG globalmodel.dart::login Called');
    setBusy(true);
    try {
      // whether to show or not
      LoginResponse loginResponse = await _authService.login(this.context, userName: userName, password: password);
      if (loginResponse.success) {
        this.data.loginMessage = loginResponse.message;
        await this.setUser(loginResponse.user);
        return true;
      } else {
        this.data.loginMessage = loginResponse.message;
        await this.setUser(User());
        return false;
      }
    } finally {
      setBusy(false);
      debugPrint('SCRIPSLOG globalmodel.dart::login Finished');
    }
  }

  // utility function to get current platform from places without a buildContext
  TargetPlatform getCurrentPlatform() {
    debugPrint('SCRIPSLOG globalmodel.dart::getCurrentPlatform Called');
    return Theme.of(context)?.platform;
  }

  void setShowOverlappedSubMenu(bool value) {
    debugPrint('SCRIPSLOG globalmodel.dart::setShowOverlappedSubMenu Called');
    setBusy(true);
    // whether to show or not
    this.data.showOverlappedSubMenu = value;
    this.data.statusText = this.data.showOverlappedSubMenu ? 'Showing Overlapped Menu' : 'Showing Fixed Menu';

    setBusy(false);
  }

  void setShowDevicePreview(bool value) {
    debugPrint('SCRIPSLOG globalmodel.dart::setShowDevicePreview Called');
    setBusy(true);
    // whether to show or not
    this.data.showDevicePreview = value;
    this.data.statusText = this.data.showDevicePreview ? 'Showing Device Preview' : 'Not Showing Device Preview';

    setBusy(false);
  }

  void setLastException(Exception exception) {
    debugPrint('SCRIPSLOG globalmodel.dart::setLastException Called');
    setBusy(true);
    // whether to show or not
    this.data.lastException = exception;
    this.data.statusText = this.data.lastException != null ? this.data.lastException.toString() : '';

    setBusy(false);
  }

  void setAnimateSubMenu(bool value) {
    debugPrint('SCRIPSLOG globalmodel.dart::setAnimateSubMenu Called');
    setBusy(true);
    // whether to show or not
    this.data.animateSubMenu = value;
    this.data.statusText = this.data.animateSubMenu ? 'Showing Animated Menu' : 'Showing Non Animated Menu';

    setBusy(false);
  }

  void setStatusText(String value) {
    debugPrint('SCRIPSLOG globalmodel.dart::setStatusText Called');
    setBusy(true);
    // whether to show or not
    this.data.statusText = value;
    setBusy(false);
  }

  Future<bool> logout() async {
    setBusy(true);
    await this.setUser(null);
    setBusy(false);
    return true;
  }
}
