// To parse this JSON data, do
//
//     final maritalStatus = maritalStatusFromJson(jsonString);

import 'dart:convert';

List<MaritalStatus> maritalStatusFromJson(String str) =>
    List<MaritalStatus>.from(
        json.decode(str).map((x) => MaritalStatus.fromJson(x)));

String maritalStatusToJson(List<MaritalStatus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaritalStatus {
  String id;
  String name;

  MaritalStatus({
    this.id,
    this.name,
  });

  factory MaritalStatus.fromJson(Map<String, dynamic> json) => MaritalStatus(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
      };
}
