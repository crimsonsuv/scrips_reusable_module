// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';

import 'insurance_model.dart';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  bool isAdult;
  String organizationId;
  String practiceId;
  String patientId;
  String firstName;
  String middleName;
  String lastName;
  DateTime birthDate;
  String gender;
  String language;
  String maritalStatus;
  String photoUrl;
  String idFrontImage;
  String idBackImage;
  bool isActive;
  DateTime lastUpdated;
  String patientMrn;
  Identification identification;
  GuardianIdenitification guardianIdenitification;
  UpdatePatientContactRequest updatePatientContactRequest;
  List<EmergencyContactList> emergencyContactResponse;
  List<InsuranceList> healthInsuranceResponse;

  Patient({
    this.patientId,
    this.isAdult,
    this.organizationId,
    this.practiceId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.language,
    this.maritalStatus,
    this.photoUrl,
    this.idFrontImage,
    this.idBackImage,
    this.isActive,
    this.lastUpdated,
    this.patientMrn,
    this.identification,
    this.guardianIdenitification,
    this.updatePatientContactRequest,
    this.emergencyContactResponse,
    this.healthInsuranceResponse,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientId: json["patientId"] == null ? null : json["patientId"],
        isAdult: json["isAdult"] == null ? true : json["isAdult"],
        organizationId:
            json["organizationId"] == null ? null : json["organizationId"],
        practiceId: json["practiceId"] == null ? null : json["practiceId"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        birthDate: (json["birthDate"] == null || json["birthDate"] == "")
            ? null
            : DateTime.parse(json["birthDate"]),
        gender: json["gender"] == null ? null : json["gender"],
        language: json["language"] == null ? null : json["language"],
        maritalStatus:
            json["maritalStatus"] == null ? null : json["maritalStatus"],
        photoUrl: json["photoURL"] == null ? null : json["photoURL"],
        idFrontImage:
            json["idFrontImage"] == null ? null : json["idFrontImage"],
        idBackImage: json["idBackImage"] == null ? null : json["idBackImage"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        lastUpdated: (json["lastUpdated"] == null || json["lastUpdated"] == "")
            ? null
            : DateTime.parse(json["lastUpdated"]),
        patientMrn: json["patientMRN"] == null ? null : json["patientMRN"],
        identification: json["identification"] == null
            ? null
            : Identification.fromJson(json["identification"]),
        guardianIdenitification: json["guardianIdenitification"] == null
            ? null
            : GuardianIdenitification.fromJson(json["guardianIdenitification"]),
        updatePatientContactRequest: json["updatePatientContactRequest"] == null
            ? null
            : UpdatePatientContactRequest.fromJson(
                json["updatePatientContactRequest"]),
        emergencyContactResponse: json["emergencyContactResponse"] == null
            ? null
            : List<EmergencyContactList>.from(json["emergencyContactResponse"]
                .map((x) => EmergencyContactList.fromJson(x))),
        healthInsuranceResponse: json["healthInsuranceResponse"] == null
            ? null
            : List<InsuranceList>.from(json["healthInsuranceResponse"]
                .map((x) => InsuranceList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isAdult": isAdult == null ? true : isAdult,
        "organizationId": organizationId == null ? "" : organizationId,
        "practiceId": practiceId == null ? "" : practiceId,
        "firstName": firstName == null ? "" : firstName,
        "middleName": middleName == null ? "" : middleName,
        "lastName": lastName == null ? "" : lastName,
        "birthDate": birthDate == null ? "" : birthDate.toIso8601String(),
        "gender": gender == null ? "" : gender,
        "language": language == null ? "" : language,
        "maritalStatus": maritalStatus == null ? "" : maritalStatus,
        "photoURL": photoUrl == null ? "" : photoUrl,
        "idFrontImage": idFrontImage == null ? "" : idFrontImage,
        "idBackImage": idBackImage == null ? "" : idBackImage,
        "isActive": isActive == null ? "" : isActive,
        "lastUpdated": lastUpdated == null ? "" : lastUpdated.toIso8601String(),
        "patientMRN": patientMrn == null ? "" : patientMrn,
        "identification": identification == null ? {} : identification.toJson(),
        "guardianIdenitification": guardianIdenitification == null
            ? {}
            : guardianIdenitification.toJson(),
        "updatePatientContactRequest": updatePatientContactRequest == null
            ? {}
            : updatePatientContactRequest.toJson(),
        "emergencyContactResponse": emergencyContactResponse == null
            ? []
            : List<dynamic>.from(
                emergencyContactResponse.map((x) => x.toJson())),
        "healthInsuranceResponse": healthInsuranceResponse == null
            ? []
            : List<dynamic>.from(
                healthInsuranceResponse.map((x) => x.toJson())),
      };
}

class GuardianIdenitification {
  String id;
  String relationId;
  String firstName;
  String middleName;
  String lastName;
  DateTime birthDate;
  String gender;
  String idType;
  String idNumber;
  DateTime idExpirationDate;

  GuardianIdenitification({
    this.id,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.idType,
    this.idNumber,
    this.idExpirationDate,
  });

  factory GuardianIdenitification.fromJson(Map<String, dynamic> json) =>
      GuardianIdenitification(
        id: json["id"] == null ? null : json["id"],
        relationId: json["relationId"] == null ? null : json["relationId"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        birthDate: (json["birthDate"] == null || json["birthDate"] == "")
            ? null
            : DateTime.parse(json["birthDate"]),
        gender: json["gender"] == null ? null : json["gender"],
        idType: json["idType"] == null ? null : json["idType"],
        idNumber: json["idNumber"] == null ? null : json["idNumber"],
        idExpirationDate:
            (json["idExpirationDate"] == null || json["idExpirationDate"] == "")
                ? null
                : DateTime.parse(json["idExpirationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "relationId": relationId == null ? "" : relationId,
        "firstName": firstName == null ? "" : firstName,
        "middleName": middleName == null ? "" : middleName,
        "lastName": lastName == null ? "" : lastName,
        "birthDate": birthDate == null
            ? DateTime.now().toIso8601String()
            : birthDate.toIso8601String(),
        "gender": gender == null ? "" : gender,
        "idType": idType == null ? "" : idType,
        "idNumber": idNumber == null ? "" : idNumber,
        "idExpirationDate": idExpirationDate == null
            ? DateTime.now().toIso8601String()
            : idExpirationDate.toIso8601String(),
      };
}

class Identification {
  String id;
  String idType;
  String idNumber;
  DateTime idExpirationDate;

  Identification({
    this.id,
    this.idType,
    this.idNumber,
    this.idExpirationDate,
  });

  factory Identification.fromJson(Map<String, dynamic> json) => Identification(
        id: json["id"] == null ? null : json["id"],
        idType: json["idType"] == null ? null : json["idType"],
        idNumber: json["idNumber"] == null ? null : json["idNumber"],
        idExpirationDate:
            (json["idExpirationDate"] == null || json["idExpirationDate"] == "")
                ? null
                : DateTime.parse(json["idExpirationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "idType": idType == null ? "" : idType,
        "idNumber": idNumber == null ? "" : idNumber,
        "idExpirationDate": idExpirationDate == null
            ? DateTime.now().toIso8601String()
            : idExpirationDate.toIso8601String(),
      };
}

class UpdatePatientContactRequest {
  String contactId;
  String patientId;
  String ownership;
  String email;
  String primaryContact;
  String secondayContact;
  int isPreferrable;
  String building;
  String apartment;
  String country;
  String city;
  String address;
  String latitude;
  String longitude;

  UpdatePatientContactRequest({
    this.contactId,
    this.patientId,
    this.ownership,
    this.email,
    this.primaryContact,
    this.secondayContact,
    this.isPreferrable,
    this.building,
    this.apartment,
    this.country,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory UpdatePatientContactRequest.fromJson(Map<String, dynamic> json) =>
      UpdatePatientContactRequest(
        contactId: json["contactId"] == null ? null : json["contactId"],
        patientId: json["patientId"] == null ? null : json["patientId"],
        ownership: json["ownership"] == null ? null : json["ownership"],
        email: json["email"] == null ? null : json["email"],
        primaryContact:
            json["primaryContact"] == null ? null : json["primaryContact"],
        secondayContact:
            json["secondayContact"] == null ? null : json["secondayContact"],
        isPreferrable:
            json["isPreferrable"] == null ? null : json["isPreferrable"],
        building: json["building"] == null ? null : json["building"],
        apartment: json["apartment"] == null ? null : json["apartment"],
        country: json["country"] == null ? null : json["country"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "contactId": contactId == null ? "" : contactId,
        "patientId": patientId == null ? "" : patientId,
        "ownership": ownership == null ? "" : ownership,
        "email": email == null ? "" : email,
        "primaryContact": primaryContact == null ? "" : primaryContact,
        "secondayContact": secondayContact == null ? "" : secondayContact,
        "isPreferrable": isPreferrable == null ? "" : isPreferrable,
        "building": building == null ? "" : building,
        "apartment": apartment == null ? "" : apartment,
        "country": country == null ? "" : country,
        "city": city == null ? "" : city,
        "address": address == null ? "" : address,
        "latitude": latitude == null ? "" : latitude,
        "longitude": longitude == null ? "" : longitude,
      };
}
