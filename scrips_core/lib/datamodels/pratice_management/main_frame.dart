import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_sub_menu.dart';

class MainFrame {
  MainMenu mainMenu = MainMenu();
  MainSubMenu mainSubMenu = MainSubMenu();
  bool mainSubMenuVisible = true;
  bool mainSubMenuStartShowing = true;
  bool showOverlappedSubMenu = false;
  bool animateSubMenu = false;
  String statusText = 'Works';
  String userId = '';
  String mainMenuPath;
  String mainSubMenuPath;

  MainFrame({this.userId, this.mainMenuPath, this.mainSubMenuPath});

  MainFrame.fromJson(Map<String, dynamic> json) {
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
