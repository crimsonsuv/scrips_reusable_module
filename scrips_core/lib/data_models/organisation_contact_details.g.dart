// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationContactDetails _$OrganizationContactDetailsFromJson(
    Map<String, dynamic> json) {
  return OrganizationContactDetails(
    country: PropertyInfo.fromJson(json['country'] as Map<String, dynamic>),
    city: PropertyInfo.fromJson(json['city'] as Map<String, dynamic>),
    address: PropertyInfo.fromJson(json['address'] as Map<String, dynamic>),
    office: PropertyInfo.fromJson(json['office'] as Map<String, dynamic>),
    officePhone:
        PropertyInfo.fromJson(json['officePhone'] as Map<String, dynamic>),
    fax: PropertyInfo.fromJson(json['fax'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrganizationContactDetailsToJson(
        OrganizationContactDetails instance) =>
    <String, dynamic>{
      'country': instance.country.toJson(),
      'city': instance.city.toJson(),
      'address': instance.address.toJson(),
      'office': instance.office.toJson(),
      'officePhone': instance.officePhone.toJson(),
      'fax': instance.fax.toJson(),
    };
