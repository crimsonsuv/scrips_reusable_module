import 'package:json_annotation/json_annotation.dart';

import 'main_menu_item.dart';

part 'main_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class MainMenu {
  List<MainMenuItem> items = [];
  MainMenuItem currentItem;

  MainMenu({this.items, this.currentItem});

  factory MainMenu.fromJson(Map<String, dynamic> json) {
    return _$MainMenuFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainMenuToJson(this);
}
