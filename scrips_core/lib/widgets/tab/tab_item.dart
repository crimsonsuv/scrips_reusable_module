import 'package:flutter/material.dart';

class TabItem {
  final String title;
  final Widget view;
  final bool isUnsaved;

  TabItem({this.title, this.view, this.isUnsaved});
}
