// Data Model for Organization
//
// take a look:https://flutter.dev/docs/development/data-and-backend/json
// and then: https://flutter.dev/docs/cookbook/networking/background-parsing (not yet implemented)
//
import 'dart:convert';

import 'data_model.dart';
import 'dart:math';

class Organization {
  // should be all finals, but not until we get all from service
  String organizationId;
  String organizationName;
  DateTime dateOfSignUp;
  int numberOfUsers;
  String mobileNumber;
  Status organizationStatus;
  String country;
  String licenseNumber;
  String licenceType;
  DateTime licenseExpirationDate;
//  String billingTaxID;
  String typeOfPractice;
  String firstName;
  String lastName;
  String email;
//  bool isPrimary;

  Organization({
    this.organizationId,
    this.dateOfSignUp,
    this.numberOfUsers = 0,
    this.mobileNumber = "",
    this.organizationStatus = Status.None,
    this.organizationName = "",
    this.country,
    this.licenseNumber,
    this.licenceType,
    this.licenseExpirationDate,
    this.typeOfPractice,
    this.firstName,
    this.lastName,
    this.email
  });

  // should take care of it with PropertyInfo class, this i quick-and-dirty solution
  Organization.fromJson(Map<String, dynamic> json)
      : this.organizationName = json['name'] ?? "",
        this.organizationId = json['organizationId'] ?? 'N/A',
        this.dateOfSignUp = DataModel.parseDate(json['dateOfSignUp']),
        this.numberOfUsers = json['numberOfUsers'] ?? "",
        this.mobileNumber = json['mobileNumber'] ?? "",
        this.organizationStatus = json['isActive'] == true ? Status.Active : Status.None,
        this.country = json['country'] ?? "",
        this.typeOfPractice = json['typeOfPractice'] ?? "",
        this.licenceType = json['licenseType'] ?? "",
        this.licenseNumber = json['licenseNumber'] ?? "",
        this.licenseExpirationDate = DataModel.parseDate(json['dateOfSignUp']),
        this.firstName = json['adminNameGiven'] ?? "",
        this.lastName = json['adminNameFamily'] ?? "",
        this.email = json['adminEmail'] ?? "";


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationId'] = this.organizationId;
    data['name'] = this.organizationName;
    data['dateOfSignUp'] = this.dateOfSignUp?.toIso8601String();
    data['mobileNumber'] = this.mobileNumber;
    data['isActive'] = this.organizationStatus == Status.Active;
    data['country'] = this.country;
    data['typeOfPractice'] = this.typeOfPractice;
    data['licenseType'] = this.licenceType;
    data['licenseNumber'] = this.licenseNumber;
    data['liceneseExpirationDate'] = this.licenseExpirationDate?.toIso8601String();
    data['adminNameGiven'] = this.firstName;
    data['adminNameFamily'] = this.lastName;
    data['adminEmail'] = this.email;
    return data;
  }
}

enum Status { None, Active }

class Country {
  String code;
  String name; // international / en ?
  String localName;
}
