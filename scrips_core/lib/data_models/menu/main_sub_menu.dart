import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/data_models/menu/menu_item.dart';

part 'main_sub_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class MainSubMenu {
  List<MenuItem> topItems = [];
  List<MenuItem> bottomItems = [];
  MenuItem currentItem;

  MainSubMenu({this.topItems, this.bottomItems, this.currentItem});

  factory MainSubMenu.fromJson(Map<String, dynamic> json) => _$MainSubMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MainSubMenuToJson(this);
}
