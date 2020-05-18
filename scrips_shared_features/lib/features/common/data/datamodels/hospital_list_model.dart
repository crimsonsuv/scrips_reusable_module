// To parse this JSON data, do
//
//     final hospitalList = hospitalListFromJson(jsonString);

import 'dart:convert';

List<HospitalList> hospitalListFromJson(String str) => List<HospitalList>.from(
    json.decode(str).map((x) => HospitalList.fromJson(x)));

String hospitalListToJson(List<HospitalList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalList {
  String id;
  String hospitalName;

  HospitalList({
    this.id,
    this.hospitalName,
  });

  factory HospitalList.fromJson(Map<String, dynamic> json) => HospitalList(
        id: json["Id"] == null ? null : json["Id"],
        hospitalName:
            json["HospitalName"] == null ? null : json["HospitalName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "HospitalName": hospitalName == null ? null : hospitalName,
      };
}
