import 'package:scrips_core/datamodels/menu/menu_item.dart';

class MainMenu {
  List<MenuItem> items = [];
  MenuItem currentItem ;

  MainMenu({this.items, this.currentItem});

  MainMenu.fromJson(Map<String, dynamic> json) {
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
