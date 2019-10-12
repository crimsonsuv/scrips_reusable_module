import 'package:flutter/cupertino.dart';

class MenuItem {
  String id;
  IconData icon;
  String name;
  String label;
  bool enabled;

  MenuItem({this.id, this.icon, this.name, this.label, this.enabled});

  MenuItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    label = json['label'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['label'] = this.label;
    data['enabled'] = this.enabled;
    return data;
  }
}
