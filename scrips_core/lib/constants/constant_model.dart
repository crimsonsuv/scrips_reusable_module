import 'dart:core';

const List<String> hoursList = [
  "12 AM",
  "01 AM",
  "02 AM",
  "03 AM",
  "04 AM",
  "05 AM",
  "06 AM",
  "07 AM",
  "08 AM",
  "09 AM",
  "10 AM",
  "11 AM",
  "12 PM",
  "01 PM",
  "02 PM",
  "03 PM",
  "04 PM",
  "05 PM",
  "06 PM",
  "07 PM",
  "08 PM",
  "09 PM",
  "10 PM",
  "11 PM",
];

const List<String> weekList = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

List<String> minList() {
  List<String> minArr = [];
  for (int i = 0; i < 60; i = i + 5) {
    if (i < 10) {
      minArr.add("0$i min");
    } else {
      minArr.add("$i min");
    }
  }
  return minArr;
}

const List<String> appointmentDurationList = ["15 min", "30 min", "45 min"];

const List<Map<String, dynamic>> pWHoursTypeList = [
  {"value": 1, "name": "Work"},
  {"value": 2, "name": "Holiday"},
  {"value": 3, "name": "Other"},
];

const List<Map<String, dynamic>> dWHoursTypeList = [
  {"value": 1, "name": "Work"},
  {"value": 2, "name": "Vacation"},
];
