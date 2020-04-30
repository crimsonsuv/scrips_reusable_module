// To parse this JSON data, do
//
//     final idType = idTypeFromJson(jsonString);

import 'dart:convert';

List<IdType> idTypeFromJson(String str) =>
    List<IdType>.from(json.decode(str).map((x) => IdType.fromJson(x)));

String idTypeToJson(List<IdType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdType {
  String id;
  String name;

  IdType({
    this.id,
    this.name,
  });

  factory IdType.fromJson(Map<String, dynamic> json) => IdType(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
      };
}
