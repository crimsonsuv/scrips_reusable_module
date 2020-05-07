// To parse this JSON data, do
//
//     final insurance = insuranceFromJson(jsonString);

import 'dart:convert';

List<Insurance> insuranceFromJson(String str) =>
    List<Insurance>.from(json.decode(str).map((x) => Insurance.fromJson(x)));

String insuranceToJson(List<Insurance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Insurance {
  String id;
  String insuranceProvider1;

  Insurance({
    this.id,
    this.insuranceProvider1,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
        id: json["Id"] == null ? null : json["Id"],
        insuranceProvider1: json["InsuranceProvider1"] == null
            ? null
            : json["InsuranceProvider1"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "InsuranceProvider1":
            insuranceProvider1 == null ? null : insuranceProvider1,
      };
}
