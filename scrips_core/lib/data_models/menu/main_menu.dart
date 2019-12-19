import 'package:json_annotation/json_annotation.dart';

import 'main_menu_item.dart';

part 'main_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class MainMenu {
  List<MainMenuItem> topItems = [];
  List<MainMenuItem> bottomItems = [];
  MainMenuItem currentItem;

  MainMenu({
    this.topItems,
    this.bottomItems,
    this.currentItem,
  });

  factory MainMenu.fromJson(Map<String, dynamic> json) {
    return _$MainMenuFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainMenuToJson(this);
}
