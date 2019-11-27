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

  MenuItem({this.id, this.iconName, this.label, this.enabled, this.semanticLabel, this.navigationRoute})
      : this.icon = _iconFromName(iconName);

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);

  static Widget _iconFromName(String iconName) {
    switch (iconName) {
      case 'home':
        Widget i = Images.instance.dashboard();
//        assert(i != null);
//        debugPrint('Here.$i');
        return i;
//      case 'directions_railway':
//      case 'directions_transit':
//        return //Icons.directions_railway;
//      case 'directions_boat':
//        return Icons.directions_boat;
//      case 'directions_subway':
//        return Icons.directions_subway;
//      case 'settings':
//        return Icons.settings;
//      case 'settings_applications':
//        return Icons.settings_applications;
//      case 'settings_backup_restore':
//        return Icons.settings_backup_restore;
      default:
        Widget i = Image.asset('assets/dashboard.png');
        return i;
    }
  }
}
