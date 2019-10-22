import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';

import 'main_sub_menu.dart';
part 'main_menu_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MainMenuItem extends MenuItem {
  MainSubMenu subMenu = MainSubMenu();
  MainMenuItem(
      {String id,
      IconData icon,
      String label,
      bool enabled,
      String semanticLabel,
      String navigationRoute,
      this.subMenu})
      : super(
            id: id,
            icon: icon,
            label: label,
            enabled: enabled,
            semanticLabel: semanticLabel,
            navigationRoute: navigationRoute);

  factory MainMenuItem.fromJson(Map<String, dynamic> json) => _$MainMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MainMenuItemToJson(this);
}
