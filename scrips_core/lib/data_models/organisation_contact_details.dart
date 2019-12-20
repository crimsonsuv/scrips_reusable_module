import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

part 'organisation_contact_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactDetails {
  //   sumeet: essential to mark all fields with @JsonKey(defaultValue: '')to ensure all PropertyInfos are created properly in fromJson
  @JsonKey(defaultValue: '')
  String country;
  @JsonKey(defaultValue: '')
  String city;
  @JsonKey(defaultValue: '')
  String address;
  @JsonKey(defaultValue: '')
  String office;
  @JsonKey(defaultValue: '')
  String officePhone;
  @JsonKey(defaultValue: '')
  String fax;

  ContactDetails({
    @required this.country,
    @required this.city,
    @required this.address,
    @required this.office,
    @required this.officePhone,
    @required this.fax,
  });

  factory ContactDetails.defaults() {
    return new ContactDetails(
      country: null,
      city: null,
      address: null,
      office: null,
      officePhone: null,
      fax: null,
    );
  }

  factory ContactDetails.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsToJson(this);
}
