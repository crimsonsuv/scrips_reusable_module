import 'package:scrips_core/data_models/menu/main_menu.dart';

class PmMainView {
  String mainMenuPath;
  String mainSubMenuPath;
  MainMenu mainMenu = MainMenu();
  bool mainSubMenuVisible = true;
  bool mainSubMenuStartShowing = true;
  bool mainProfileMenuOpened = false;
  String statusText = '';

  PmMainView({this.mainMenuPath, this.mainSubMenuPath, this.mainSubMenuVisible, this.mainProfileMenuOpened});

  PmMainView.fromJson(Map<String, dynamic> json) {
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
