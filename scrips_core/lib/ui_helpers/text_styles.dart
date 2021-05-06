import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/utils/user_app_global.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

//String defaultFontFamily = "tajawal";
//Color defaultBackgroundColor = mainContainedAreaBackgroundColor;

TextStyle defaultHeaderStyle(color, backgroundColor) => TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: headerTextSize,
      fontWeight: FontWeight.w900,
      color: color ?? defaultHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultHeaderBackgroundColor,
    );

TextStyle defaultSubHeaderStyle(color, backgroundColor) => TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: subHeaderTextSize,
      fontWeight: FontWeight.w500,
      color: color ?? defaultSubHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultSubHeaderBackgroundColor,
    );

TextStyle labelTextStyle500Weight(double size, color,
        {double letterSpacing,
        double height,
        TextDecoration textDecoration = TextDecoration.none}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color ?? textInputColor,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        height: height);

TextStyle boldLabelTextStyle(double size, color,
        {double letterSpacing, double lineHeight}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color ?? textInputColor,
        letterSpacing: letterSpacing,
        height: lineHeight);

TextStyle semiBoldLabelTextStyle(double size, color,
        {double letterSpacing, double height}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color ?? textInputColor,
        letterSpacing: letterSpacing,
        height: height);

TextStyle normalBoldTextStyle(double size, color,
        {double letterSpacing, double height = 1.2}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color ?? textInputColor,
        letterSpacing: letterSpacing,
        height: height);

TextStyle lightLabelTextStyle(double size, color,
        {double height = 1.2, double letterSpacing}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color ?? textInputColor,
        letterSpacing: letterSpacing,
        height: height);

TextStyle normalLabelTextStyle(double size, color,
        {double height = 1.2,
        double letterSpacing,
        FontStyle fontStyle,
        TextDecoration decoration = TextDecoration.none}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontStyle: fontStyle,
        fontWeight: FontWeight.normal,
        color: color ?? textInputColor,
        letterSpacing: letterSpacing,
        decoration: decoration,
        height: height);

//TextStyle( fontFamily: languageCode=='ar'? Fonts.tajawal:Fonts.roboto,fontSize: 12.0, fontWeight: FontWeight.bold, color: labelTextStyleTextColor)
TextStyle defaultFieldLabelStyle(
  color,
  backgroundColor, {
  bool isReversed = false,
  double letterSpacing,
}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: labelTextSize,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing ?? letterSpacing,
      color: color ??
          (!isReversed
              ? labelTextStyleTextColor
              : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultLabelBackgroundColor
              : defaultReversedLabelBackgroundColor),
    );

TextStyle defaultLabelStyle(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: labelTextSize,
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultLabelBackgroundColor
              : defaultReversedLabelBackgroundColor),
    );

TextStyle defaultLabelStyleSmall(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: labelSmallTextSize,
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultLabelBackgroundColor
              : defaultReversedLabelBackgroundColor),
    );

TextStyle defaultLabelStyleLarge(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: labelLargeTextSize,
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultLabelBackgroundColor
              : defaultReversedLabelBackgroundColor),
    );

TextStyle defaultMenuItemTextStyle(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: menuItemTextSize,
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultLabelBackgroundColor
              : defaultReversedLabelBackgroundColor),
    );
//
TextStyle defaultValidationStyle(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: validationTextSize,
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed
              ? defaultValidationTextColor
              : defaultReversedValidationTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultValidationBackgroundColor
              : defaultReversedValidationBackgroundColor),
    );
//
TextStyle defaultFieldStyle(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: fieldTextSize,
      fontWeight: FontWeight.normal,
      color: color ??
          (!isReversed ? defaultFieldTextColor : defaultReversedFieldTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultFieldBackgroundColor
              : defaultReversedFieldBackgroundColor),
    );

TextStyle defaultHintStyle(color, backgroundColor, {bool isReversed = false}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: hintTextSize,
      fontWeight: FontWeight.normal,
      color: defaultFieldHintColor,
      backgroundColor: backgroundColor ?? defaultFieldBackgroundColor,
    );

TextStyle cardDescTextStyle(double size, color,
        {double height = 1.43, double letterSpacing = 1}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        fontWeight: FontWeight.normal,
        letterSpacing: letterSpacing,
        color: color ?? textInputColor,
        height: height);

TextStyle cardDirectionTextStyle(double size, color,
        {double height = 1.43, double letterSpacing}) =>
    TextStyle(
        fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
        fontSize: size,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.bold,
        color: color ?? textInputColor,
        height: height);

TextStyle extraBoldLabelTextStyle(double size, color, {double letterSpacing}) =>
    TextStyle(
      fontFamily: languageCode == 'ar' ? Fonts.tajawal : Fonts.roboto,
      fontSize: size,
      fontWeight: FontWeight.w800,
      letterSpacing: letterSpacing,
      color: color ?? textInputColor,
    );
