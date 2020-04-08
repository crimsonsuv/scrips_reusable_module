// To parse this JSON data, do
//
//     final insuranceList = insuranceListFromJson(jsonString);

import 'dart:convert';

List<InsuranceList> insuranceListFromJson(String str) =>
    List<InsuranceList>.from(
        json.decode(str).map((x) => InsuranceList.fromJson(x)));

String insuranceListToJson(List<InsuranceList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsuranceList {
  String healthInsuranceId;
  String patientId;
  String insuranceProvider;
  String policyNumber;
  DateTime eligiblityStartDate;
  DateTime expirationDate;
  bool isPrimary;

  InsuranceList({
    this.healthInsuranceId,
    this.patientId,
    this.insuranceProvider,
    this.policyNumber,
    this.eligiblityStartDate,
    this.expirationDate,
    this.isPrimary,
  });

  factory InsuranceList.fromJson(Map<String, dynamic> json) => InsuranceList(
        healthInsuranceId: json["healthInsuranceId"] == null
            ? null
            : json["healthInsuranceId"],
        patientId: json["patientId"] == null ? null : json["patientId"],
        insuranceProvider: json["insuranceProvider"] == null
            ? null
            : json["insuranceProvider"],
        policyNumber:
            json["policyNumber"] == null ? null : json["policyNumber"],
        eligiblityStartDate: json["eligiblityStartDate"] == null
            ? null
            : DateTime.parse(json["eligiblityStartDate"]),
        expirationDate: json["expirationDate"] == null
            ? null
            : DateTime.parse(json["expirationDate"]),
        isPrimary: json["isPrimary"] == null ? null : json["isPrimary"],
      );

  Map<String, dynamic> toJson() => {
        "healthInsuranceId": healthInsuranceId == null ? "" : healthInsuranceId,
        "patientId": patientId == null ? "" : patientId,
        "insuranceProvider": insuranceProvider == null ? "" : insuranceProvider,
        "policyNumber": policyNumber == null ? "" : policyNumber,
        "eligiblityStartDate": eligiblityStartDate == null
            ? null
            : eligiblityStartDate.toIso8601String(),
        "expirationDate":
            expirationDate == null ? null : expirationDate.toIso8601String(),
        "isPrimary": isPrimary == null ? null : isPrimary,
      };
}
