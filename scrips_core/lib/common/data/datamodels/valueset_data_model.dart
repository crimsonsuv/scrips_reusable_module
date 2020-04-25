// To parse this JSON data, do
//
//     final valueSetData = valueSetDataFromJson(jsonString);

import 'dart:convert';

List<ValueSetData> valueSetDataFromJson(String str) => List<ValueSetData>.from(
    json.decode(str).map((x) => ValueSetData.fromJson(x)));

String valueSetDataToJson(List<ValueSetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ValueSetData {
  ValueCoding valueCoding;

  ValueSetData({
    this.valueCoding,
  });

  factory ValueSetData.fromJson(Map<String, dynamic> json) => ValueSetData(
        valueCoding: json["valueCoding"] == null
            ? null
            : ValueCoding.fromJson(json["valueCoding"]),
      );

  Map<String, dynamic> toJson() => {
        "valueCoding": valueCoding == null ? null : valueCoding.toJson(),
      };
}

class ValueCoding {
  String code;
  String display;
  String system;

  ValueCoding({
    this.code,
    this.display,
    this.system,
  });

  factory ValueCoding.fromJson(Map<String, dynamic> json) => ValueCoding(
        code: json["code"] == null ? null : json["code"],
        display: json["display"] == null ? null : json["display"],
        system: json["system"] == null ? null : json["system"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "display": display == null ? null : display,
        "system": system,
      };
}
