import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'main_sub_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class MainSubMenu {
  List<MenuItem> items = [];
  MenuItem currentItem;

  MainSubMenu({this.items, this.currentItem});

  factory MainSubMenu.fromJson(Map<String, dynamic> json) => _$MainSubMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MainSubMenuToJson(this);
}
