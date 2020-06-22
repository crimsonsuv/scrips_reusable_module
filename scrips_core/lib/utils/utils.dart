import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrips_core/constants/status_objects.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

enum sortType { asc, desc }

bool isBlank(String value) {
  return value == null || value == '';
}

double internalMaxWidth(context, isExpanded) {
  bool useMobileLayout = MediaQuery.of(context).size.width < 600;
//  double mainMenuWidth = useMobileLayout
//      ? (MediaQuery.of(context).orientation == Orientation.portrait
//          ? (MediaQuery.of(context).size.width / 7)
//          : (MediaQuery.of(context).size.width / 4))
//      : MediaQuery.of(context).size.width / 2 / 7;
//  double mainSubMenuWidth = !useMobileLayout
//      ? MediaQuery.of(context).size.width / 4
//      : MediaQuery.of(context).size.width / 2;
  double mainMenuWidth = 56;
  double mainSubMenuWidth = 220;

  return (useMobileLayout)
      ? MediaQuery.of(context).size.width
      : ((MediaQuery.of(context).size.width -
                  (mainMenuWidth + mainSubMenuWidth)) <
              738
          ? MediaQuery.of(context).size.width -
              (mainMenuWidth + mainSubMenuWidth + 8)
          : (isExpanded)
              ? MediaQuery.of(context).size.width -
                  (mainMenuWidth + mainSubMenuWidth + 8)
              : 738);
}

String _debugLogPrefix = 'SCRIPS';
void debugLog(String message) {
  debugPrint('$_debugLogPrefix - ${DateTime.now().toString()} - $message');
}

String scDateFormat(value, {String format = 'MMM dd, yyyy'}) {
  if (value == null) {
    return "";
  } else {
    return DateFormat(format)?.format(value);
  }
}

String scTimeFormat(value, {String format = 'h:mma'}) {
  if (value == null) {
    return "";
  } else {
    return DateFormat(format)?.format(value);
  }
}

File fileFromJson(String fileData) {
  return null;
}

String fileToJson(File fileData) {
  return "";
}

DateTime dateTimeFromISOString(String stringDate) {
  if (isBlank(stringDate)) {
    return null;
  } else {
    // match seconds (:23) followed by . or , with 7 or more digits
    // e.g. is string '2019-12-05T22:04:02.6282341+00:00' it will match ':02.6282341'
    RegExp rx = RegExp(r':\d{2}[.,]\d{7,}');
    if (rx.hasMatch(stringDate)) {
      String str = rx.stringMatch(stringDate);
      stringDate = stringDate.replaceAll(
          str, str.substring(0, 10)); // cut off decimals over microsecond
    }
    return DateTime.parse(stringDate);
  }
}

String dateTimeToISOString(DateTime aDate) {
  if (aDate == null) {
    return null;
  } else {
    return aDate?.toIso8601String();
  }
}

class ValueDisplayPair {
  final String value;
  final String label;
  final IconData icon;
  final bool isEnabled;
  ValueDisplayPair({this.value, this.label, this.icon, this.isEnabled = true});
}

class ColorCodePair {
  final int colorCode;
  final String value;
  ColorCodePair({
    this.colorCode,
    this.value,
  });
}

bool isPlatformStandard(BuildContext context) {
  switch (Theme.of(context)?.platform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
    case TargetPlatform.fuchsia:
      return true;
    default:
      return false;
  }
}

bool isPlatformExperimental(BuildContext context) {
  return !isPlatformStandard(context);
}

bool isBetween(int x, int lower, int upper) {
  return lower <= x && x <= upper;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Failure handleFailure(DioError e) {
  int responseCode = e.response.statusCode;
  if (isBetween(responseCode, 400, 499)) {
    return Failure("Request fields are missing.");
  } else if (isBetween(responseCode, 500, 599)) {
    return Failure(
        "Something bad happend in Server, please contact scrips support.");
  } else {
    return Failure(e?.message ?? "");
  }
}
