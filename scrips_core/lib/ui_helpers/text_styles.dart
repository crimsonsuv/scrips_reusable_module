import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

//String defaultFontFamily = "Roboto";
//Color defaultBackgroundColor = mainContainedAreaBackgroundColor;

TextStyle defaultHeaderStyle(color, backgroundColor) => TextStyle(
      fontSize: headerTextSize,
      fontWeight: FontWeight.w900,
      color: color ?? defaultHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultHeaderBackgroundColor,
    );
TextStyle defaultSubHeaderStyle(color, backgroundColor) => TextStyle(
      fontSize: subHeaderTextSize,
      fontWeight: FontWeight.w500,
      color: color ?? defaultSubHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultSubHeaderBackgroundColor,
    );
TextStyle boldLabelTextStyle(double size, color) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color ?? textInputColor,
    );

TextStyle semiBoldLabelTextStyle(double size, color) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color ?? textInputColor,
    );

TextStyle normalBoldTextStyle(double size, color) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color ?? textInputColor,
    );

TextStyle normalLabelTextStyle(double size, color, {double height = 1.2}) =>
    TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
        color: color ?? textInputColor,
        height: height);

// TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: labelTextStyleTextColor)
TextStyle defaultFieldLabelStyle(color, backgroundColor,
        {bool isReversed = false}) =>
    TextStyle(
      fontSize: labelTextSize,
      fontWeight: FontWeight.bold,
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
      fontFamily: Fonts.roboto,
      fontSize: hintTextSize,
      fontWeight: FontWeight.normal,
      color: defaultFieldHintColor,
      backgroundColor: backgroundColor ?? defaultFieldBackgroundColor,
    );
