// To parse this JSON data, do
//
//     final practiceCodeList = practiceCodeListFromJson(jsonString);

import 'dart:convert';

List<CodeList> practiceCodeListFromJson(String str) =>
    List<CodeList>.from(json.decode(str).map((x) => CodeList.fromJson(x)));

String practiceCodeListToJson(List<CodeList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CodeList {
  String specialitySkillId;
  Code code;

  CodeList({
    this.specialitySkillId,
    this.code,
  });

  factory CodeList.fromJson(Map<String, dynamic> json) => CodeList(
        specialitySkillId: json["specialitySkillId"] == null
            ? null
            : json["specialitySkillId"],
        code: json["code"] == null ? null : Code.fromJson(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "specialitySkillId":
            specialitySkillId == null ? null : specialitySkillId,
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
        system: json["System"] == null ? null : json["System"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "displayName": displayName == null ? null : displayName,
        "System": system == null ? null : system,
      };
}
