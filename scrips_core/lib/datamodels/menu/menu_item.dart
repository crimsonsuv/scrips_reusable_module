import 'package:flutter/cupertino.dart';

class MenuItem {
  String id;
  IconData icon;
  String label;
  bool enabled;
  String navigationRoute;

  MenuItem({this.id, this.icon, this.label, this.enabled, this.navigationRoute});

  MenuItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    label = json['label'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['label'] = this.label;
    data['enabled'] = this.enabled;
    return data;
  }
}
