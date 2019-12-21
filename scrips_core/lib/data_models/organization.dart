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
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

import 'organisation_contact_details.dart';

part 'organization.g.dart';

//https://github.com/dart-lang/json_serializable/blob/master/example/lib/example.dart

@JsonSerializable(explicitToJson: true, checked: false)
class Organization {
  // should be all finals, but not until we get all from service
  @JsonKey(fromJson: fileFromJson, toJson: fileToJson)
  File organizationLogo;
  @JsonKey()
  String organizationId;
  @JsonKey()
  String name;
  @JsonKey(fromJson: dateTimeFromISOString, toJson: dateTimeToISOString)
  DateTime dateOfSignUp;
  @JsonKey(fromJson: dateTimeFromISOString, toJson: dateTimeToISOString)
  DateTime lastSignIn;
  @JsonKey()
  int numberOfUsers;
  @JsonKey()
  String mobileNumber;
  @JsonKey()
  bool isActive;
  @JsonKey()
  String country;
  @JsonKey()
  String licenseNumber;
  @JsonKey()
  String licenseType;
  @JsonKey(fromJson: fileFromJson, toJson: fileToJson)
  File licenceFrontSide;
  @JsonKey(fromJson: fileFromJson, toJson: fileToJson)
  File licenseBackSide;
  @JsonKey(fromJson: dateTimeFromISOString, toJson: dateTimeToISOString)
  DateTime liceneseExpirationDate;
  @JsonKey()
  String typeOfPractice;
  @JsonKey()
  String adminNameGiven;
  @JsonKey()
  String adminNameFamily;
  @JsonKey()
  String adminEmail;
  @JsonKey(defaultValue: {})
  ContactDetails contactDetails;
//  bool isPrimary;

  Organization(
      {this.organizationLogo,
      this.organizationId,
      this.dateOfSignUp,
      this.numberOfUsers,
      this.mobileNumber,
      this.isActive,
      this.name,
      this.country,
      this.licenseNumber,
      this.licenseType,
      this.licenceFrontSide,
      this.licenseBackSide,
      this.liceneseExpirationDate,
      this.typeOfPractice,
      this.adminNameGiven,
      this.adminNameFamily,
      this.adminEmail,
      this.contactDetails});

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
  //DataModel.parseDate(json['dateOfSignUp']),   this.dateOfSignUp?.toIso8601String();
  // should take care of it with PropertyInfo class, this i quick-and-dirty solution

}
