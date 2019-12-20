// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    organizationId: json['organizationId'] as String ?? '',
    dateOfSignUp: dateTimeFromISOString(json['dateOfSignUp'] as String),
    numberOfUsers: json['numberOfUsers'] as int ?? 0,
    mobileNumber: json['mobileNumber'] as String ?? '',
    organizationStatus: json['organizationStatus'] as String ?? '',
    organizationName: json['organizationName'] as String ?? '',
    country: json['country'] as String ?? '',
    licenseNumber: json['licenseNumber'] as String ?? '',
    licenceType: json['licenceType'] as String,
    licenseExpirationDate:
        dateTimeFromISOString(json['licenseExpirationDate'] as String),
    typeOfPractice: json['typeOfPractice'] as String ?? '',
    firstName: json['firstName'] as String ?? '',
    lastName: json['lastName'] as String ?? '',
    email: json['email'] as String ?? '',
    contactDetails: Organization._contactDetailsFromJson(
        json['contactDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'dateOfSignUp': dateTimeToISOString(instance.dateOfSignUp),
      'numberOfUsers': instance.numberOfUsers,
      'mobileNumber': instance.mobileNumber,
      'organizationStatus': instance.organizationStatus,
      'country': instance.country,
      'licenseNumber': instance.licenseNumber,
      'licenceType': instance.licenceType,
      'licenseExpirationDate':
          dateTimeToISOString(instance.licenseExpirationDate),
      'typeOfPractice': instance.typeOfPractice,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'contactDetails': instance.contactDetails?.toJson(),
    };
