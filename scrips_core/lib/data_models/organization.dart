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
  String name;
  DateTime dateOfSignUp;
  int numberOfUsers;
  String mobileNumber;
  OrganizationStatus status;

  //
  Country country;
  String licenseNumber;
  String licenseIssuingAuthority;
  DateTime licenseExpirationDate;
  String billingTaxID;
  String practiceDescription;
  bool isPrimary;

  Organization({
    this.organizationId,
    this.dateOfSignUp,
    this.numberOfUsers = 0,
    this.mobileNumber = "",
    this.status = OrganizationStatus.None,
    this.name = "",
//    this.country,
//    this.licenseNumber,
//    this.licenseIssuingAuthority,
//    this.licenseExpirationDate,
//    this.billingTaxID,
//    this.practiceDescription,
//    this.isPrimary,
  });

  // should take care of it with PropertyInfo class, this i quick-and-dirty solution
  Organization.fromJson(Map<String, dynamic> json)
      : this.name = json['name'] ?? "",
        this.organizationId = json['organizationId'] ?? 'N/A',
        this.dateOfSignUp = DataModel.parseDate(json['dateOfSignUp']),
        this.numberOfUsers = json['numberOfUsers'] ?? "",
        this.mobileNumber = json['mobileNumber'] ?? "",
        this.status = json['isActive'] == true
            ? OrganizationStatus.Active
            : OrganizationStatus.None;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationId'] = this.organizationId;
    data['name'] = this.name;
    data['dateOfSignUp'] = this.dateOfSignUp?.toIso8601String();
    data['mobileNumber'] = this.mobileNumber;
    data['isActive'] = this.status == OrganizationStatus.Active;
    return data;
  }
}

enum OrganizationStatus { None, Active }

class Country {
  String code;
  String name; // international / en ?
  String localName;
}
