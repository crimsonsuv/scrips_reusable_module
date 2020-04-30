// To parse this JSON data, do
//
//     final patientsList = patientsListFromJson(jsonString);

import 'dart:convert';

PatientsList patientsListFromJson(String str) =>
    PatientsList.fromJson(json.decode(str));

String patientsListToJson(PatientsList data) => json.encode(data.toJson());

class PatientsList {
  int currentPage;
  int totalPage;
  int count;
  List<PatientDatum> patientData;

  PatientsList({
    this.currentPage,
    this.totalPage,
    this.count,
    this.patientData,
  });

  factory PatientsList.fromJson(Map<String, dynamic> json) => PatientsList(
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        totalPage: json["totalPage"] == null ? null : json["totalPage"],
        count: json["count"] == null ? null : json["count"],
        patientData: json["patientData"] == null
            ? null
            : List<PatientDatum>.from(
                json["patientData"].map((x) => PatientDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage == null ? null : currentPage,
        "totalPage": totalPage == null ? null : totalPage,
        "count": count == null ? null : count,
        "patientData": patientData == null
            ? null
            : List<dynamic>.from(patientData.map((x) => x.toJson())),
      };
}

class PatientDatum {
  String patientId;
  String organizationId;
  String practiceId;
  String name;
  String contactNumber;
  dynamic ispreferrable;
  String image;
  DateTime birthDate;
  String mrn;
  DateTime lastUpdated;
  bool status;
  bool isArchived;

  PatientDatum({
    this.patientId,
    this.organizationId,
    this.practiceId,
    this.name,
    this.contactNumber,
    this.ispreferrable,
    this.image,
    this.birthDate,
    this.mrn,
    this.lastUpdated,
    this.status,
    this.isArchived,
  });

  factory PatientDatum.fromJson(Map<String, dynamic> json) => PatientDatum(
        patientId: json["patientId"] == null ? null : json["patientId"],
        organizationId:
            json["organizationId"] == null ? null : json["organizationId"],
        practiceId: json["practiceId"] == null ? null : json["practiceId"],
        name: json["name"] == null ? null : json["name"],
        contactNumber:
            json["contactNumber"] == null ? null : json["contactNumber"],
        ispreferrable: json["ispreferrable"],
        image: json["image"] == null ? null : json["image"],
        birthDate: (json["birthDate"] == null || json["birthDate"] == "")
            ? null
            : DateTime.parse(json["birthDate"]),
        mrn: json["mrn"] == null ? null : json["mrn"],
        lastUpdated: (json["lastUpdated"] == null || json["lastUpdated"] == "")
            ? null
            : DateTime.parse(json["lastUpdated"]),
        status: json["status"] == null ? null : json["status"],
        isArchived: json["isArchived"] == null ? null : json["isArchived"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId == null ? null : patientId,
        "organizationId": organizationId == null ? null : organizationId,
        "practiceId": practiceId == null ? null : practiceId,
        "name": name == null ? null : name,
        "contactNumber": contactNumber == null ? null : contactNumber,
        "ispreferrable": ispreferrable,
        "image": image == null ? null : image,
        "birthDate": birthDate == null ? null : birthDate.toIso8601String(),
        "mrn": mrn == null ? null : mrn,
        "lastUpdated":
            lastUpdated == null ? null : lastUpdated.toIso8601String(),
        "status": status == null ? null : status,
        "isArchived": isArchived == null ? null : isArchived,
      };
}
