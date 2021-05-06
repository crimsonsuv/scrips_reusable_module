import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

TextStyle primaryLightBlueBoldTextStyle({double size = 13}) =>
    boldLabelTextStyle(size, enabledBtnBGColor, letterSpacing: -0.7);

TextStyle subTextGreyTextStyle({double size = 11}) =>
    normalLabelTextStyle(size, Color(0xffB7B7B7),
        height: 1.43, letterSpacing: -0.4);

TextStyle userNameTextStyle() =>
    boldLabelTextStyle(15, textInputColor, lineHeight: 1);

TextStyle userInfoTextStyle() => normalBoldTextStyle(13, Color(0xff485685));

TextStyle whiteColorNormalTextStyle({double size = 11}) =>
    normalLabelTextStyle(size, Colors.white);

TextStyle popupHeaderTitleStyle() =>
    boldLabelTextStyle(13, textInputColor, letterSpacing: -0.4, lineHeight: 1);

TextStyle selectionHeading12() =>
    boldLabelTextStyle(12, textInputColor, letterSpacing: 0.8);

TextStyle checkBoxTitleStyle() => normalLabelTextStyle(15, regularTextColor,
    height: 1.4, letterSpacing: -0.4);

TextStyle editTextHintTextStyle() => normalLabelTextStyle(13, Color(0xffB7B7B7),
    height: 1.4, letterSpacing: -0.4);

TextStyle suggestionTextStyle() => normalLabelTextStyle(13, Color(0xff485685),
    height: 1.4, letterSpacing: -0.4);

TextStyle scripsTextBlue13Style() =>
    normalLabelTextStyle(13, scripsTextBlueColor,
        height: 1.4, letterSpacing: -0.4);

TextStyle scripsTextBlue13BoldStyle() =>
    boldLabelTextStyle(13, scripsTextBlueColor,
        letterSpacing: -0.4);

/// heading / title related
TextStyle titleTextStyle({size = 15.0}) =>
    boldLabelTextStyle(size, scripsTextBlueColor,
        lineHeight: 1.43, letterSpacing: -0.6);

TextStyle titleBlue13TextStyle({double height, double spacing}) =>
    boldLabelTextStyle(13, scripsTitleBlueColor,
        lineHeight: height, letterSpacing: spacing);

TextStyle titleBlue15TextStyle({double height, double spacing}) =>
    boldLabelTextStyle(15, scripsTitleBlueColor,
        lineHeight: height, letterSpacing: spacing);

TextStyle titleBlue17TextStyle({double height, double spacing}) =>
    boldLabelTextStyle(17, scripsTitleBlueColor,
        lineHeight: height, letterSpacing: spacing);

TextStyle titleBlue12TextStyle({double height, double spacing}) =>
    boldLabelTextStyle(12, scripsTitleBlueColor,
        lineHeight: height, letterSpacing: spacing);

TextStyle titleBlack13TextStyle({double height, double spacing}) =>
    boldLabelTextStyle(13, Colors.black,
        lineHeight: height, letterSpacing: spacing);

/// description related
TextStyle bodyBlack13TextStyle({double height, double spacing}) =>
    normalLabelTextStyle(13, Colors.black,
        height: height, letterSpacing: spacing);

TextStyle bodyBlack11TextStyle({double height, double spacing}) =>
    normalLabelTextStyle(11, Colors.black,
        height: height, letterSpacing: spacing);

TextStyle bodySubtextGery13TextStyle({double height, double spacing}) =>
    normalLabelTextStyle(13, scripsSubTextColor,
        height: height, letterSpacing: spacing);

TextStyle bodyTextBlue13TextStyle({double height, double spacing}) =>
    normalLabelTextStyle(13, scripsTextBlueColor,
        height: height, letterSpacing: spacing);
