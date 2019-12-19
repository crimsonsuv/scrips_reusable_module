import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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

String scDateFormat(val){
  if(val == null){
    return "";
  } else {
    return DateFormat('dd-MM-yyyy')?.format(val);
  }
}

