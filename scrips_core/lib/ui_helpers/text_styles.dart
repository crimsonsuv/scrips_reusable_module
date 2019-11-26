import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

String defaultFontFamily = "Roboto";
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
//
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
      fontWeight: FontWeight.w500,
      color: color ??
          (!isReversed ? defaultFieldTextColor : defaultReversedFieldTextColor),
      backgroundColor: backgroundColor ??
          (!isReversed
              ? defaultFieldBackgroundColor
              : defaultReversedFieldBackgroundColor),
    );

TextStyle defaultHintStyle(color, backgroundColor, {bool isReversed = false}) =>
    TextStyle(
      fontSize: hintTextSize,
      fontWeight: FontWeight.w500,
      color: defaultFieldHintColor,
      backgroundColor: backgroundColor ?? defaultFieldBackgroundColor,
    );
