import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/datamodels/user/user.dart';

class Global {
  bool showOverlappedSubMenu = false;
  bool animateSubMenu = false;
  bool showDevicePreview = false;
  String statusText = '';
  User user = User();
  String loginMessage = '';
  String localeCode = PM_DEFAULT_LOCALE_CODE;
  String localeCountry = PM_DEFAULT_LOCALE_COUNTRY;
  Exception lastException;

  Global({this.user, this.showOverlappedSubMenu, this.showDevicePreview, this.animateSubMenu});

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
