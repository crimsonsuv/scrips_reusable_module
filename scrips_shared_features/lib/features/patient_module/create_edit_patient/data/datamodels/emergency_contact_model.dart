// To parse this JSON data, do
//
//     final emergencyContactList = emergencyContactListFromJson(jsonString);

import 'dart:convert';

List<EmergencyContactList> emergencyContactListFromJson(String str) =>
    List<EmergencyContactList>.from(
        json.decode(str).map((x) => EmergencyContactList.fromJson(x)));

String emergencyContactListToJson(List<EmergencyContactList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmergencyContactList {
  String emergencyContactId;
  String patientId;
  String relationship;
  String firstName;
  String lastName;
  String contactNumber;
  bool isProxy;

  EmergencyContactList({
    this.emergencyContactId,
    this.patientId,
    this.relationship,
    this.firstName,
    this.lastName,
    this.contactNumber,
    this.isProxy,
  });

  factory EmergencyContactList.fromJson(Map<String, dynamic> json) =>
      EmergencyContactList(
        emergencyContactId: json["emergencyContactId"] == null
            ? null
            : json["emergencyContactId"],
        patientId: json["patientId"] == null ? null : json["patientId"],
        relationship:
            json["relationship"] == null ? null : json["relationship"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        contactNumber:
            json["contactNumber"] == null ? null : json["contactNumber"],
        isProxy: json["isProxy"] == null ? null : json["isProxy"],
      );

  Map<String, dynamic> toJson() => {
        "emergencyContactId":
            emergencyContactId == null ? "" : emergencyContactId,
        "patientId": patientId == null ? "" : patientId,
        "relationship": relationship == null ? "" : relationship,
        "firstName": firstName == null ? "" : firstName,
        "lastName": lastName == null ? "" : lastName,
        "contactNumber": contactNumber == null ? "" : contactNumber,
        "isProxy": isProxy == null ? false : isProxy,
      };
}
