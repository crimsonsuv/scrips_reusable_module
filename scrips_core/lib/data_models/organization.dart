// Data Model for Organization
//
// take a look:https://flutter.dev/docs/development/data-and-backend/json
// and then: https://flutter.dev/docs/cookbook/networking/background-parsing (not yet implemented)
//
import 'data_model.dart';

class Organization {
  // should be all finals, but not until we get all from service
  final String organizationId;
  final String name;
  final DateTime dateOfSignUp;
  final int numberOfUsers;
  final String mobileNumber;
  final OrganizationStatus status;

  //
//  Country country;
//  String licenseNumber;
//  String licenseIssuingAuthority;
//  DateTime licenseExpirationDate;
//  String billingTaxID;
//  String practiceDescription;
//  bool isPrimary;

  Organization({
    this.organizationId,
    this.dateOfSignUp,
    this.numberOfUsers,
    this.mobileNumber,
    this.status,
    this.name,
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
      : this.name = json['name'],
        this.organizationId = json['organizationId'],
        this.dateOfSignUp = DataModel.parseDate(json['dateOfSignUp']),
        this.numberOfUsers = json['numberOfUsers'],
        this.mobileNumber = json['mobileNumber'],
        this.status = json['status'] == "active" ? OrganizationStatus.Active : OrganizationStatus.None;
}

enum OrganizationStatus { None, Active }

class Country {
  String code;
  String name; // international / en ?
  String localName;
}
