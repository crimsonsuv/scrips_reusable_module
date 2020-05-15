// To parse this JSON data, do
//
//     final degreeValueSet = degreeValueSetFromJson(jsonString);

import 'dart:convert';

List<DegreeValueSet> degreeValueSetFromJson(String str) =>
    List<DegreeValueSet>.from(
        json.decode(str).map((x) => DegreeValueSet.fromJson(x)));

String degreeValueSetToJson(List<DegreeValueSet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DegreeValueSet {
  String degree;
  Code code;

  DegreeValueSet({
    this.degree,
    this.code,
  });

  factory DegreeValueSet.fromJson(Map<String, dynamic> json) => DegreeValueSet(
        degree: json["degree"] == null ? null : json["degree"],
        code: json["code"] == null ? null : Code.fromJson(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "degree": degree == null ? null : degree,
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
