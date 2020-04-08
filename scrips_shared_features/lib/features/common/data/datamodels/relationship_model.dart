// To parse this JSON data, do
//
//     final relationship = relationshipFromJson(jsonString);

import 'dart:convert';

List<Relationship> relationshipFromJson(String str) => List<Relationship>.from(
    json.decode(str).map((x) => Relationship.fromJson(x)));

String relationshipToJson(List<Relationship> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Relationship {
  String id;
  String name;

  Relationship({
    this.id,
    this.name,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
      };
}
