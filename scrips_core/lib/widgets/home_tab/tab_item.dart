import 'package:flutter/material.dart';

class TabItem {
  final String title;
  final Widget view;
  final Widget icon;
  final String count;
  final bool isUnsaved;

  TabItem({this.title, this.view, this.icon,this.isUnsaved,this.count});
}
