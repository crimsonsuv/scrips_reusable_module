import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:scrips_core/general/property_info.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

bool isBlank(String value) {
  return value == null || value == '';
}

String _debugLogPrefix = 'SCRIPS';
void debugLog(String message) {
  debugPrint('$_debugLogPrefix - ${DateTime.now().toString()} - $message');
}

String scDateFormat(value) {
  if (value == null) {
    return "";
  } else {
    return DateFormat('dd-MM-yyyy')?.format(value);
  }
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

PropertyInfo<DateTime> dateTimePiFromISOString(String stringDate) {
  return PropertyInfo<DateTime>(dateTimeFromISOString(stringDate));
}

String dateTimePiToISOString(PropertyInfo<DateTime> piDate) {
  return dateTimeToISOString(piDate?.value);
}
