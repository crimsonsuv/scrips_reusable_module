// To parse this JSON data, do
//
//     final createPatientResponse = createPatientResponseFromJson(jsonString);

import 'dart:convert';

CreatePatientResponse createPatientResponseFromJson(String str) =>
    CreatePatientResponse.fromJson(json.decode(str));

String createPatientResponseToJson(CreatePatientResponse data) =>
    json.encode(data.toJson());

class CreatePatientResponse {
  String patientId;
  String firstName;
  String middleName;
  String lastName;
  DateTime lastUpdated;
  String language;
  String patientMrn;
  bool status;

  CreatePatientResponse({
    this.patientId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.lastUpdated,
    this.language,
    this.patientMrn,
    this.status,
  });

  factory CreatePatientResponse.fromJson(Map<String, dynamic> json) =>
      CreatePatientResponse(
        patientId: json["patientId"] == null ? null : json["patientId"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        lastUpdated: json["lastUpdated"] == null
            ? null
            : DateTime.parse(json["lastUpdated"]),
        language: json["language"] == null ? null : json["language"],
        patientMrn: json["patientMRN"] == null ? null : json["patientMRN"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId == null ? null : patientId,
        "firstName": firstName == null ? null : firstName,
        "middleName": middleName == null ? null : middleName,
        "lastName": lastName == null ? null : lastName,
        "lastUpdated":
            lastUpdated == null ? null : lastUpdated.toIso8601String(),
        "language": language == null ? null : language,
        "patientMRN": patientMrn == null ? null : patientMrn,
        "status": status == null ? null : status,
      };
}
