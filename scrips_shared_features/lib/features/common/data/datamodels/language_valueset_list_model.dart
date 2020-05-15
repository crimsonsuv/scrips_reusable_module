// To parse this JSON data, do
//
//     final languageValueSetList = languageValueSetListFromJson(jsonString);

import 'dart:convert';

List<LanguageValueSetList> languageValueSetListFromJson(String str) =>
    List<LanguageValueSetList>.from(
        json.decode(str).map((x) => LanguageValueSetList.fromJson(x)));

String languageValueSetListToJson(List<LanguageValueSetList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguageValueSetList {
  String languageId;
  Code code;

  LanguageValueSetList({
    this.languageId,
    this.code,
  });

  factory LanguageValueSetList.fromJson(Map<String, dynamic> json) =>
      LanguageValueSetList(
        languageId: json["languageId"] == null ? null : json["languageId"],
        code: json["code"] == null ? null : Code.fromJson(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "languageId": languageId == null ? null : languageId,
        "code": code == null ? null : code.toJson(),
      };
}

class Code {
  String code;
  String displayName;
  String system;

  Code({
    this.code,
    this.displayName,
    this.system,
  });

  factory Code.fromJson(Map<String, dynamic> json) => Code(
        code: json["code"] == null ? null : json["code"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        system: json["system"] == null ? null : json["system"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "displayName": displayName == null ? null : displayName,
        "system": system == null ? null : system,
      };
}
