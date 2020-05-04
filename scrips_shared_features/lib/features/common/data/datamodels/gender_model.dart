// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

List<Gender> genderFromJson(String str) =>
    List<Gender>.from(json.decode(str).map((x) => Gender.fromJson(x)));

String genderToJson(List<Gender> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gender {
  String id;
  String gender;

  Gender({
    this.id,
    this.gender,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["Id"] == null ? null : json["Id"],
        gender: json["Gender"] == null ? null : json["Gender"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Gender": gender == null ? null : gender,
      };
}
