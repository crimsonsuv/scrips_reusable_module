import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

Widget greenTextBackground(Widget child, {padding = const EdgeInsets.all(3)}) =>
    Container(
      child: child,
      padding: padding,
      decoration: BoxDecoration(
          color: successTabColor, borderRadius: BorderRadius.circular(2)),
    );

Widget textWithColoredBackground(Widget child,
        {Color bgColor, padding = const EdgeInsets.all(3)}) =>
    Container(
      child: child,
      padding: padding,
      decoration: BoxDecoration(
          color: bgColor ?? successTabColor,
          borderRadius: BorderRadius.circular(2)),
    );

Decoration searchBackgroundDecoration() => BoxDecoration(
    color: Color(0x1F8E8E93), borderRadius: BorderRadius.circular(10));

Decoration defaultBackgroundDecoration({Color bgColor}) => BoxDecoration(
    color: bgColor ?? separatorColor, borderRadius: BorderRadius.circular(13));

Decoration defaultWhiteBackgroundDecoration() =>
    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13));

Decoration defaultBorderDecoration({color}) => BoxDecoration(
    color: color,
    border: Border.all(color: separatorColor),
    borderRadius: BorderRadius.circular(13));

ShapeBorder defaultShapeBorder() =>
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13)));
