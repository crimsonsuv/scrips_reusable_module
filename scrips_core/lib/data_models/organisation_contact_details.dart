import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

part 'organisation_contact_details.g.dart';

@JsonSerializable(explicitToJson: true)
class OrganizationContactDetails {
  //   sumeet: essential to mark all fields with @JsonKey(nullable: false, defaultValue: '')to ensure all PropertyInfos are created properly in fromJson
  @JsonKey(nullable: false, defaultValue: '')
  String country;
  @JsonKey(nullable: false, defaultValue: '')
  String city;
  @JsonKey(nullable: false, defaultValue: '')
  String address;
  @JsonKey(nullable: false, defaultValue: '')
  String office;
  @JsonKey(nullable: false, defaultValue: '')
  String officePhone;
  @JsonKey(nullable: false, defaultValue: '')
  String fax;

  OrganizationContactDetails({
    @required this.country,
    @required this.city,
    @required this.address,
    @required this.office,
    @required this.officePhone,
    @required this.fax,
  });

  factory OrganizationContactDetails.defaults() {
    return new OrganizationContactDetails(
      country: null,
      city: null,
      address: null,
      office: null,
      officePhone: null,
      fax: null,
    );
  }

  factory OrganizationContactDetails.fromJson(Map<String, dynamic> json) =>
      _$OrganizationContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationContactDetailsToJson(this);
}
