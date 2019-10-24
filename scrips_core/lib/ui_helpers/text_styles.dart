import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle defaultHeaderStyle(color, backgroundColor) => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: color ?? defaultHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultHeaderBackgroundColor,
    );
TextStyle defaultSubHeaderStyle(color, backgroundColor) => TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: color ?? defaultSubHeaderTextColor,
      backgroundColor: backgroundColor ?? defaultSubHeaderBackgroundColor,
    );
//
TextStyle defaultLabelStyle(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultLabelBackgroundColor : defaultReversedLabelBackgroundColor),
    );
TextStyle defaultLabelStyleSmall(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultLabelBackgroundColor : defaultReversedLabelBackgroundColor),
    );
TextStyle defaultLabelStyleLarge(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultLabelBackgroundColor : defaultReversedLabelBackgroundColor),
    );
TextStyle defaultMenuItemTextStyle(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultLabelBackgroundColor : defaultReversedLabelBackgroundColor),
    );
//
TextStyle defaultValidationStyle(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultLabelTextColor : defaultReversedLabelTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultLabelBackgroundColor : defaultReversedLabelBackgroundColor),
    );
//
TextStyle defaultFieldStyle(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: color ?? (!isReversed ? defaultFieldTextColor : defaultReversedFieldTextColor),
      backgroundColor: backgroundColor ?? (!isReversed ? defaultFieldBackgroundColor : defaultReversedFieldBackgroundColor),
    );

TextStyle defaultHintStyle(color, backgroundColor, {bool isReversed = false}) => TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: defaultFieldHintColor,
      backgroundColor: backgroundColor ?? defaultFieldBackgroundColor,
    );
