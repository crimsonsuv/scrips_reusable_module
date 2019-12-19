import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

part 'organisation_contact_details.g.dart';

@JsonSerializable(explicitToJson: true)
class OrganizationContactDetails {
  //   sumeet: essential to mark all fields with @JsonKey(nullable: false)to ensure all PropertyInfos are created properly in fromJson
  @JsonKey(nullable: false)
  PropertyInfo<String> country;
  @JsonKey(nullable: false)
  PropertyInfo<String> city;
  @JsonKey(nullable: false)
  PropertyInfo<String> address;
  @JsonKey(nullable: false)
  PropertyInfo<String> office;
  @JsonKey(nullable: false)
  PropertyInfo<String> officePhone;
  @JsonKey(nullable: false)
  PropertyInfo<String> fax;

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
      country: PropertyInfo<String>(null),
      city: PropertyInfo<String>(null),
      address: PropertyInfo<String>(null),
      office: PropertyInfo<String>(null),
      officePhone: PropertyInfo<String>(null),
      fax: PropertyInfo<String>(null),

    );
  }

  factory OrganizationContactDetails.fromJson(Map<String, dynamic> json) => _$OrganizationContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationContactDetailsToJson(this);
}
