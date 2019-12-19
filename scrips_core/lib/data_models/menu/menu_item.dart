import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

part 'menu_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItem {
  String id;

  //
  String iconName;

  //
  @JsonKey(ignore: true)
  Widget icon;
  String label;
  String semanticLabel;
  bool enabled;
  String navigationRoute;

  MenuItem({
    this.id,
    this.iconName,
    this.label,
    this.enabled,
    this.semanticLabel,
    this.navigationRoute,
  }) : this.icon = _iconFromName(iconName);

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);

  static Widget _iconFromName(String iconName) {
    switch (iconName) {
      case 'home':
        return Images.instance.dashboard();
      case 'clinic':
        return Images.instance.clinic();
      case 'messages':
        return Images.instance.messages();
      case 'notification':
        return Images.instance.notification();
      case 'profile':
        return Images.instance.profile();
      default:
        return Image.asset('assets/dashboard.png');
    }
  }
}
