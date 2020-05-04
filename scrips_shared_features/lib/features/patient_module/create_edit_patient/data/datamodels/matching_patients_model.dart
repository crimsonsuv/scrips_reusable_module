// To parse this JSON data, do
//
//     final matchingPatient = matchingPatientFromJson(jsonString);

import 'dart:convert';

List<MatchingPatient> matchingPatientFromJson(String str) =>
    List<MatchingPatient>.from(
        json.decode(str).map((x) => MatchingPatient.fromJson(x)));

String matchingPatientToJson(List<MatchingPatient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchingPatient {
  String patientId;
  String name;
  DateTime birthDate;
  String idType;
  String profileImageUrl;
  String idNumber;

  MatchingPatient({
    this.patientId,
    this.name,
    this.birthDate,
    this.idType,
    this.profileImageUrl,
    this.idNumber,
  });

  factory MatchingPatient.fromJson(Map<String, dynamic> json) =>
      MatchingPatient(
        patientId: json["patientId"] == null ? null : json["patientId"],
        name: json["name"] == null ? null : json["name"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        idType: json["idType"] == null ? null : json["idType"],
        profileImageUrl:
            json["profileImageURL"] == null ? null : json["profileImageURL"],
        idNumber: json["idNumber"] == null ? null : json["idNumber"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId == null ? null : patientId,
        "name": name == null ? null : name,
        "birthDate": birthDate == null ? null : birthDate.toIso8601String(),
        "idType": idType == null ? null : idType,
        "profileImageURL": profileImageUrl == null ? null : profileImageUrl,
        "idNumber": idNumber == null ? null : idNumber,
      };
}
