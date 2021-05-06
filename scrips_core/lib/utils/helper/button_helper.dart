import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

import 'card_helper.dart';

Widget textButton(String text,
        {TextStyle style,
        VoidCallback callback,
        EdgeInsets padding = EdgeInsets.zero,
        double fontSize = 13,
        bool isLoading = false,
        bool enable = true,
        double width}) =>
    InkWell(
      onTap: callback,
      child: Padding(
        padding: padding,
        child: isLoading
            ? Container(
                height: 16,
                width: width ?? 16,
                alignment: Alignment.center,
                child: SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          scripsPrimaryLightBlueColor),
                    )),
              )
            : Text(
                text,
                style: style ??
                    labelTextStyle500Weight(
                        fontSize, enable ? scripsPrimaryLightBlueColor : scripsIconsGreyColor),
              ),
      ),
    );

Widget textIconButton(
  String text,
  int icon, {
  double width,
  TextStyle style,
  Color iconColor,
  VoidCallback callback,
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    InkWell(
      onTap: callback,
      child: Padding(
        padding: padding,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6,
          children: [
            ScripsIcons.instance.icon(icon, size: 16, color: iconColor),
            Text(
              text,
              style: style ??
                  semiBoldLabelTextStyle(11, scripsIconsGreyColor,
                      letterSpacing: -0.4),
            ),
          ],
        ),
      ),
    );

Widget scripsIconButton(int icon,
        {double size,
        Color color,
        VoidCallback callback,
        GestureTapDownCallback onTapDown,
        EdgeInsets padding = EdgeInsets.zero,
        bool paddingMultiplier = false}) =>
    InkWell(
      onTap: callback,
      onTapDown: onTapDown,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        padding: padding,
        color: Colors.transparent,
        child: ScripsIcons.instance.icon(icon,
            color: color, size: paddingMultiplier ? size * 1.14 : size),
      ),
    );

Widget scripsCircularIconButton(int icon,
        {double size = 20,
        Color color,
        Color background,
        VoidCallback callback,
        double elevation,
        EdgeInsets padding = const EdgeInsets.all(2)}) =>
    InkWell(
      onTap: callback,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: circularCard(
          ScripsIcons.instance.icon(icon, color: color, size: size),
          padding: padding,
          color: background,
          elevation: elevation,
          size: size + 2 * padding.left),
    );

Widget roundedCornerRectangularButton(
  String text, {
  Color color,
  Color backgroundColor,
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
  TextStyle style,
  VoidCallback callback,
  double height,
}) =>
    InkWell(
      onTap: callback,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor ?? bgColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: style ?? labelTextStyle500Weight(15, color),
        ),
      ),
    );
