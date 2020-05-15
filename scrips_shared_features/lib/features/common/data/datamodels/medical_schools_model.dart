// To parse this JSON data, do
//
//     final medicalSchools = medicalSchoolsFromJson(jsonString);

import 'dart:convert';

List<MedicalSchools> medicalSchoolsFromJson(String str) =>
    List<MedicalSchools>.from(
        json.decode(str).map((x) => MedicalSchools.fromJson(x)));

String medicalSchoolsToJson(List<MedicalSchools> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalSchools {
  String id;
  String medicalSchool;

  MedicalSchools({
    this.id,
    this.medicalSchool,
  });

  factory MedicalSchools.fromJson(Map<String, dynamic> json) => MedicalSchools(
        id: json["Id"] == null ? null : json["Id"],
        medicalSchool:
            json["MedicalSchool"] == null ? null : json["MedicalSchool"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "MedicalSchool": medicalSchool == null ? null : medicalSchool,
      };
}
