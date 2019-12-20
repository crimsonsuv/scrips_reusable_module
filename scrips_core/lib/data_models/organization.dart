// Data Model for Organization
//
// take a look:https://flutter.dev/docs/development/data-and-backend/json
// and then: https://flutter.dev/docs/cookbook/networking/background-parsing (not yet implemented)
//
//
// this.dateOfSignUp = DataModel.parseDate(json['dateOfSignUp']),
//       data['dateOfSignUp'] = this.dateOfSignUp.toIso8601String();
import 'dart:convert';

import 'package:scrips_core/utils/utils.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

import 'organisation_contact_details.dart';

part 'organization.g.dart';

@JsonSerializable(explicitToJson: true, checked: false)
class Organization {
  // should be all finals, but not until we get all from service
  @JsonKey(nullable: false, defaultValue: '')
  String organizationId;
  @JsonKey(nullable: false, defaultValue: '')
  String organizationName;
  @JsonKey(fromJson: dateTimeFromISOString, toJson: dateTimeToISOString)
  DateTime dateOfSignUp;
  @JsonKey(nullable: false, defaultValue: 0)
  int numberOfUsers;
  @JsonKey(nullable: false, defaultValue: '')
  String mobileNumber;
  @JsonKey(nullable: false, defaultValue: '')
  String organizationStatus;
  @JsonKey(nullable: false, defaultValue: '')
  String country;
  @JsonKey(nullable: false, defaultValue: '')
  String licenseNumber;
  @JsonKey(nullable: false, defaultValue: null)
  String licenceType;
  @JsonKey(fromJson: dateTimeFromISOString, toJson: dateTimeToISOString)
  DateTime licenseExpirationDate;
  @JsonKey(nullable: false, defaultValue: '')
  String typeOfPractice;
  @JsonKey(nullable: false, defaultValue: '')
  String firstName;
  @JsonKey(nullable: false, defaultValue: '')
  String lastName;
  @JsonKey(nullable: false, defaultValue: '')
  String email;
  @JsonKey(fromJson: _contactDetailsFromJson)
  OrganizationContactDetails contactDetails;
//  bool isPrimary;

  Organization(
      {this.organizationId,
      this.dateOfSignUp,
      this.numberOfUsers,
      this.mobileNumber,
      this.organizationStatus,
      this.organizationName,
      this.country,
      this.licenseNumber,
      this.licenceType,
      this.licenseExpirationDate,
      this.typeOfPractice,
      this.firstName,
      this.lastName,
      this.email,
      this.contactDetails});

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
  //DataModel.parseDate(json['dateOfSignUp']),   this.dateOfSignUp?.toIso8601String();
  // should take care of it with PropertyInfo class, this i quick-and-dirty solution

  static OrganizationContactDetails _contactDetailsFromJson(
      Map<String, dynamic> json) {
    return OrganizationContactDetails.fromJson(
        json['contactDetails'] ?? Map<String, dynamic>());
  }
}
