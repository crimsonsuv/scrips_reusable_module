// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetails _$ContactDetailsFromJson(Map<String, dynamic> json) {
  return ContactDetails(
    country: json['country'] as String ?? '',
    city: json['city'] as String ?? '',
    address: json['address'] as String ?? '',
    office: json['office'] as String ?? '',
    officePhone: json['officePhone'] as String ?? '',
    fax: json['fax'] as String ?? '',
  );
}

Map<String, dynamic> _$ContactDetailsToJson(ContactDetails instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'address': instance.address,
      'office': instance.office,
      'officePhone': instance.officePhone,
      'fax': instance.fax,
    };
