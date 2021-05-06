import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

Widget verticalLine(
        {Color color = separatorColor,
        double width = 1,
        double height,
        double radius = 0}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );

Widget horizontalLine(
        {Color color = separatorColor,
        double width,
        double height = 1,
        double radius = 0}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );

Widget horizontalLineWithProgress(
        {bool isLoading,
        Color color = separatorColor,
        double width,
        double height = 1,
        double radius = 0}) =>
    isLoading
        ? SizedBox(
            height: 1,
            child: LinearProgressIndicator(
              backgroundColor: enabledBtnBGColor.withOpacity(0.2),
            ),
          )
        : horizontalLine(
            color: color, width: width, height: height, radius: radius);
