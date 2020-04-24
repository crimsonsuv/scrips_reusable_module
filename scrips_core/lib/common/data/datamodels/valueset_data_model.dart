// To parse this JSON data, do
//
//     final valueSetData = valueSetDataFromJson(jsonString);

import 'dart:convert';

List<ValueSetData> valueSetDataFromJson(String str) => List<ValueSetData>.from(
    json.decode(str).map((x) => ValueSetData.fromJson(x)));

String valueSetDataToJson(List<ValueSetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ValueSetData {
  String code;
  String display;
  dynamic system;

  ValueSetData({
    this.code,
    this.display,
    this.system,
  });

  factory ValueSetData.fromJson(Map<String, dynamic> json) => ValueSetData(
        code: json["Code"] == null ? null : json["Code"],
        display: json["Display"] == null ? null : json["Display"],
        system: json["System"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Display": display == null ? null : display,
        "System": system,
      };
}
