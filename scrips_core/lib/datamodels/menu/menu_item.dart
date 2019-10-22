import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'menu_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItem {
  String id;
  @JsonKey(ignore: true)
  IconData icon;
  String label;
  String semanticLabel;
  bool enabled;
  String navigationRoute;

  MenuItem(
      {this.id, this.icon, this.label, this.enabled, this.semanticLabel, this.navigationRoute});

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
