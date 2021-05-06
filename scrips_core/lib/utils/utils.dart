import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/api_exception_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'decimal_input_formatter.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

enum sortType { asc, desc }

bool isBlank(value) {
  return value == null || value == '';
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

double internalMaxWidth(context, isExpanded) {
  bool useMobileLayout = MediaQuery
      .of(context)
      .size
      .width < 600;
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
      ? MediaQuery
      .of(context)
      .size
      .width
      : ((MediaQuery
      .of(context)
      .size
      .width - (mainMenuWidth + mainSubMenuWidth)) < 738
      ? MediaQuery
      .of(context)
      .size
      .width - (mainMenuWidth + mainSubMenuWidth + 8)
      : (isExpanded)
      ? MediaQuery
      .of(context)
      .size
      .width - (mainMenuWidth + mainSubMenuWidth + 8)
      : 738);
}

String _debugLogPrefix = 'SCRIPS';

void debugLog(String message) {
  debugPrint('$_debugLogPrefix - ${DateTime.now().toString()} - $message');
}

bool isToday(DateTime d) => d != null ? dateOnly(d) == dateOnly(DateTime.now()) : false;

DateTime dateOnly(DateTime date, {bool addHour = false, bool addMinute = false}) =>
    date != null
        ? DateTime(date.year, date.month, date.day, addHour ? date.hour : 0, addMinute ? date.minute : 0)
        : null;

String scDateFormat(value, {String format = 'MMM dd, yyyy'}) {
  if (value == null) {
    return "";
  } else {
    return DateFormat(format)?.format(value);
  }
}

DateTime scDate(value, {String format = 'MMM dd, yyyy'}) {
  if (value == null) {
    return DateTime.now();
  } else {
    return DateFormat(format)?.parse(value);
  }
}

dynamic scDateParsing(String value, {String format = 'MMM dd, yyyy'}) {
  if (RegExp(
    r'^(0[1-9]|[12][0-9]|3[01])[/.](0[1-9]|1[012])[/.](19|20)\d\d$',
  ).hasMatch(value)) {
    try {
      return DateFormat(format)?.parse(value);
    } on FormatException {
      return 1;
    }
  } else {
    return 0;
  }
}

String scDateTimeFormat(value, {String format = 'MMM dd, yyyy h:mma'}) {
  if (value == null) {
    return "";
  } else {
    return DateFormat(format)?.format(value)?.replaceAll("AM", "a")?.replaceAll("PM", "p");
  }
}

// String scTimeFormat(value, {String format = 'h:mma'}) {
//   if (value == null) {
//     return "";
//   } else {
//     return DateFormat(format)?.format(value);
//   }
// }

String scTimeFormatSingleLetter(value, {String format = 'h:mma'}) {
  if (value == null) {
    return "";
  } else {
    return DateFormat(format)?.format(value)?.replaceAll("AM", "a")?.replaceAll("PM", "p");
  }
}

String scTimeFormatTimeOfDay(TimeOfDay value, {String format = 'h:mma'}) {
  if (value == null || value.hour == null) {
    return "";
  } else {
    var date = DateTime.now();
    return DateFormat(format)
        ?.format(DateTime(date.year, date.month, date.day, value.hour, value.minute))
        ?.replaceAll("AM", "a")
        ?.replaceAll("PM", "p");
  }
}

String scServerTimeFormatTimeOfDay(TimeOfDay value, {String format = 'HH:mm', String language = 'en'}) {
  if (value == null || value.hour == null) {
    return "";
  } else {
    var date = DateTime.now();
    return DateFormat(format, language)?.format(DateTime(date.year, date.month, date.day, value.hour, value.minute));
  }
}

DateTime scServerUtcDateParser(String date) {
  if (date == null) return null;
  if (date.toLowerCase().contains("z")) {
    return DateTime.tryParse(date);
  } else {
    return DateTime.tryParse(date + "Z");
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
      stringDate = stringDate.replaceAll(str, str.substring(0, 10)); // cut off decimals over microsecond
    }
    return DateTime.parse(stringDate);
  }
}

// String dateTimeToFormat(int mils, String format) {
//   var date = DateTime.fromMillisecondsSinceEpoch(mils * 1000).toUtc();
//   var formattedDate = DateFormat(format).format(date);
//   return formattedDate.replaceAll("AM", "a").replaceAll("PM", "p");
// }

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
  switch (Theme
      .of(context)
      ?.platform) {
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
  if (e.error == "XMLHttpRequest error.") {
    return Failure("Processing failed due to CORS issue.");
  } else if (e?.response?.statusCode != null) {
    int responseCode = e.response.statusCode;
    if (responseCode == 400) {
      try {
        ApiExceptionModel exceptionModel = apiExceptionModelFromJson(utf8.decode(e.response.data));
        if (exceptionModel != null) {
          return Failure(exceptionModel.errors.values.map((e) => e.join(", ")).join("\n"));
        }
        return Failure("Failed to process request");
      } on TypeError {
        return Failure("Failed to process request");
      } on NoSuchMethodError {
        return Failure("Failed to process request");
      } on FormatException {
        return Failure("Failed to process request");
      }
    }
    if (isBetween(responseCode, 402, 499)) {
      return Failure("Request fields are missing.");
    } else if (isBetween(responseCode, 500, 599)) {
      return Failure("Something bad happened in Server, please contact Scrips support.");
    } else {
      return Failure(e?.message ?? "");
    }
  } else {
    return Failure('Processing failed');
  }
}

Future<String> accessToken() async {
  var pref = await SharedPreferences.getInstance();
  String token = pref.getString(scripsAccessToken);
  if (token == null) {
    return null;
  } else {
    return token;
  }
}

Future<String> getUserData() async {
  return SharedPreferences.getInstance().then((pref) async {
    return pref.getString(scripsLoggedPAUser);
  });
}

const deviceAndroid = "Android";
const deviceIOS = "iOS";
const deviceWeb = "Web";

const stringQType = "String";
const booleanQType = "Boolean";
const choiceQType = "Choice";
const openChoiceQType = "OpenChoice";
const groupQType = "Group";

const scripsAccessToken = "scrips_token";
const scripsDeviceToken = "scrips_device_token";
const scripsRefreshToken = "scrips_r_token";
const scripsLoggedPAUser = "scrips_pa_user";
const scripsLoggedPMUser = "scrips_pm_user";
const scripsLoggedUAUser = "scrips_ua_user";
const lastSelectedMenu = "scrips_selected_menu";
const currentTimezone = "scrips_curr_timezone";

String localeCode = "localeCode";
String localeCountry = "localeCountry";
const sessionExpired = "Session expired, Please relogin";

const appointmentTypeFirst = "ROUTINE";
const appointmentTypeFollowUp = "FOLLOWUP";

const appointmentLocationOffice = "Office";
const appointmentLocationHome = "Home";
const appointmentLocationVirtual = "Virtual";

const appointmentStatusArrived = "Arrived";
const appointmentStatusBooked = "Booked";
const appointmentStatusCancelled = "Cancelled";
const appointmentStatusCheckedIn = "CheckedIn";
const appointmentStatusNoShow = "NoShow";
const appointmentStatusProposed = "Proposed";
const appointmentStatusPending = "Pending";
const appointmentStatusWaitlist = "Waitlist";
const appointmentStatusFulfilled = "Fulfilled";
const appointmentStatusEnteredInError = "EnteredInError";

const apointmentCancellationReason = "AppointmentCancellationReason";
const appointmentType = "AppointmentType";
const appointmentStatus = "AppointmentStatus";
const reasonsForBookAppointment = "ReasonsForBookAppointment";

const participantPatient = "Patient";
const participantProvider = "Provider";

const imageAreaOrganization = "ORGANIZATION";
const imageAreaPractice = "PRACTICE";
const imageAreaPatient = "PATIENT";
const imageAreaDoctor = "DOCTOR";
const imageAreaStaff = "STAFF";

const lastLoginTimeKey = "lastLog";

const scripsAdminRole = "0";
const orgAdminRole = "1";
const staffRole = "2";
const doctorRole = "3";
const nurseTenantRole = "4";
const paymentTypeSelfPay = "Self-pay";
const paymentTypeInsurance = "Insurance";
const paymentTypeCorporate = "Corporate";

String removeDecimalZeroFormat(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}

String ordinal(int count) {
  if (count == 11 || count == 12 || count == 13) {
    return '${count}th';
  }
  if (count % 10 == 1) {
    return '${count}st';
  }
  if (count % 10 == 2) {
    return '${count}nd';
  }
  if (count % 10 == 3) {
    return '${count}rd';
  }
  return '${count}th';
}

const conditionStatusActive = "Active";
const conditionStatusResolved = "Resolved";

bool isValidString(String s) => s != null && s.isNotEmpty && s != "null";

String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();

String capitalizeFirstCharacter(String s) => s != null && s.length > 1 ? s[0].toUpperCase() + s.substring(1) : s;

String displayOnlyStringValuesFromList([List<String> values]) =>
    values
        .toString()
        .replaceFirst(new RegExp(r'[^\w\s]+'), '')
        .replaceRange(values
        .toString()
        .length - 2, values
        .toString()
        .length - 1, '');

List<TextInputFormatter> numberFormatter = [
  FilteringTextInputFormatter.digitsOnly,
];

TextInputFormatter doubleNumberFormatter = FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,1}'));

double calculateBmi(double weight, double heightInCm) {
  if (weight == null || heightInCm == null) return null;

  return ((weight * 10000) / (heightInCm * heightInCm)).roundToDouble();
}

enum ProviderDataType { somed, icd, procedure, medication, labs, radiology, billingProcedure }

List<TextInputFormatter> percentageFormatter({double min, double max}) {
  return [
    DecimalTextInputFormatter(decimalRange: 2),
    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        if (text.isNotEmpty) {
          double.parse(text);
        } else {
          return newValue;
        }
        if (double.parse(text) > 100) {
          return oldValue;
        }
        if (max != null) {
          if (double.parse(text) > max) {
            return oldValue;
          }
        }
        if (min != null) {
          if (double.parse(text) < min) {
            return oldValue;
          }
        }
        return newValue;
      } catch (e) {}
      return oldValue;
    }),
  ];
}
