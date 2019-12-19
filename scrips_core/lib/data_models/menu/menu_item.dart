import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/constants/app_assets.dart';

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
      default:
        return Image.asset('assets/dashboard.png');
    }
  }
}
