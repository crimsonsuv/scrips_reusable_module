// To parse this JSON data, do
//
//     final ownership = ownershipFromJson(jsonString);

import 'dart:convert';

List<Ownership> ownershipFromJson(String str) =>
    List<Ownership>.from(json.decode(str).map((x) => Ownership.fromJson(x)));

String ownershipToJson(List<Ownership> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ownership {
  String id;
  String name;

  Ownership({
    this.id,
    this.name,
  });

  factory Ownership.fromJson(Map<String, dynamic> json) => Ownership(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
      };
}
