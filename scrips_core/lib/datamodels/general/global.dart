import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/general/property_info.dart';

class Global {
  PropertyInfo<bool> showOverlappedSubMenu = PropertyInfo(false);
  PropertyInfo<bool> animateSubMenu = PropertyInfo(false);
  PropertyInfo<bool> showBottomTabBar = PropertyInfo(false);
  PropertyInfo<bool> showDevicePreview = PropertyInfo(false);
  PropertyInfo<String> statusText = PropertyInfo('');
  PropertyInfo<String> loginMessage = PropertyInfo('');
  PropertyInfo<String> loginError = PropertyInfo('');
  PropertyInfo<String> localeCode = PropertyInfo(PM_DEFAULT_LOCALE_CODE);
  PropertyInfo<String> localeCountry = PropertyInfo(PM_DEFAULT_LOCALE_COUNTRY);
  PropertyInfo<Exception> lastException = PropertyInfo(null);
  User user = User.defaults();
  MainMenu mainMenu = MainMenu();

  Global(
      {@required this.user,
      this.showOverlappedSubMenu,
      this.showDevicePreview,
      this.animateSubMenu});

  Global.fromJson(Map<String, dynamic> json) {
    //todo: fromJson
//    this.items = [];
//    json.map((k2, v2) {
//      this.items.add(MainMenuItem(
//          id: k2, icon: v2['icon'], name: v2['name'], label: v2['label'], enabled: v2['enabled']));
//    });
  }

  Map<String, dynamic> toJson() {
    //todo: toJson
//    final Map<String, dynamic> data = new Map<String, MainMenuItem>();
//    this.items.map((k, v) {
//      data['id'] = v;
//    }
//    return data;
//
    return new Map<String, dynamic>();
  }
}
