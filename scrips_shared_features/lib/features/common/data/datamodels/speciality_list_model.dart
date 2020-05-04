// To parse this JSON data, do
//
//     final Speciality = SpecialityFromJson(jsonString);

import 'dart:convert';

List<Speciality> specialityFromJson(String str) =>
    List<Speciality>.from(json.decode(str).map((x) => Speciality.fromJson(x)));

String specialityToJson(List<Speciality> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Speciality {
  String title;
  String id;

  Speciality({
    this.title,
    this.id,
  });

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
        title: json["Title"] == null ? null : json["Title"],
        id: json["Id"] == null ? null : json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Id": id == null ? null : id,
      };
}
