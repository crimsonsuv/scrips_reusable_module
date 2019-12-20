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

@JsonSerializable(explicitToJson: true)
class Organization {
  // should be all finals, but not until we get all from service
  @JsonKey(nullable: false)
  PropertyInfo<String> organizationId;
  @JsonKey(nullable: false)
  PropertyInfo<String> organizationName;
  @JsonKey(fromJson: dateTimePiFromISOString, toJson: dateTimePiToISOString)
  PropertyInfo<DateTime> dateOfSignUp;
  @JsonKey(nullable: false)
  PropertyInfo<int> numberOfUsers;
  @JsonKey(nullable: false)
  PropertyInfo<String> mobileNumber;
  @JsonKey(nullable: false)
  PropertyInfo<String> organizationStatus;
  @JsonKey(nullable: false)
  PropertyInfo<String> country;
  @JsonKey(nullable: false)
  PropertyInfo<String> licenseNumber;
  @JsonKey(nullable: false)
  PropertyInfo<String> licenceType;
  @JsonKey(fromJson: dateTimePiFromISOString, toJson: dateTimePiToISOString)
  PropertyInfo<DateTime> licenseExpirationDate;
  @JsonKey(nullable: false)
  PropertyInfo<String> typeOfPractice;
  @JsonKey(nullable: false)
  PropertyInfo<String> firstName;
  @JsonKey(nullable: false)
  PropertyInfo<String> lastName;
  @JsonKey(nullable: false)
  PropertyInfo<String> email;
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
