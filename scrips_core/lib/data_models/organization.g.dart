// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    organizationLogo: fileFromJson(json['organizationLogo'] as String),
    organizationId: json['organizationId'] as String,
    dateOfSignUp: dateTimeFromISOString(json['dateOfSignUp'] as String),
    numberOfUsers: json['numberOfUsers'] as int ?? 0,
    mobileNumber: json['mobileNumber'] as String,
    isActive: json['isActive'] as bool ?? false,
    name: json['name'] as String,
    country: json['country'] as String,
    licenseNumber: json['licenseNumber'] as String,
    licenseType: json['licenseType'] as String,
    licenceFrontSide: fileFromJson(json['licenceFrontSide'] as String),
    licenseBackSide: fileFromJson(json['licenseBackSide'] as String),
    liceneseExpirationDate:
        dateTimeFromISOString(json['liceneseExpirationDate'] as String),
    typeOfPractice: json['typeOfPractice'] as String,
    adminNameGiven: json['adminNameGiven'] as String,
    adminNameFamily: json['adminNameFamily'] as String,
    adminEmail: json['adminEmail'] as String,
    contactDetails: json['contactDetails'] == null
        ? null
        : ContactDetails.fromJson(
                json['contactDetails'] as Map<String, dynamic>) ??
            {},
  )..lastSignIn = dateTimeFromISOString(json['lastSignIn'] as String);
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'organizationLogo': fileToJson(instance.organizationLogo),
      'organizationId': instance.organizationId,
      'name': instance.name,
      'dateOfSignUp': dateTimeToISOString(instance.dateOfSignUp),
      'lastSignIn': dateTimeToISOString(instance.lastSignIn),
      'numberOfUsers': instance.numberOfUsers,
      'mobileNumber': instance.mobileNumber,
      'isActive': instance.isActive,
      'country': instance.country,
      'licenseNumber': instance.licenseNumber,
      'licenseType': instance.licenseType,
      'licenceFrontSide': fileToJson(instance.licenceFrontSide),
      'licenseBackSide': fileToJson(instance.licenseBackSide),
      'liceneseExpirationDate':
          dateTimeToISOString(instance.liceneseExpirationDate),
      'typeOfPractice': instance.typeOfPractice,
      'adminNameGiven': instance.adminNameGiven,
      'adminNameFamily': instance.adminNameFamily,
      'adminEmail': instance.adminEmail,
      'contactDetails': instance.contactDetails?.toJson(),
    };
