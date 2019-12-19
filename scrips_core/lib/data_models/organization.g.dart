// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    organizationId:
        PropertyInfo.fromJson(json['organizationId'] as Map<String, dynamic>),
    dateOfSignUp:
        PropertyInfo.fromJson(json['dateOfSignUp'] as Map<String, dynamic>),
    numberOfUsers:
        PropertyInfo.fromJson(json['numberOfUsers'] as Map<String, dynamic>),
    mobileNumber:
        PropertyInfo.fromJson(json['mobileNumber'] as Map<String, dynamic>),
    organizationStatus: PropertyInfo.fromJson(
        json['organizationStatus'] as Map<String, dynamic>),
    organizationName:
        PropertyInfo.fromJson(json['organizationName'] as Map<String, dynamic>),
    country: PropertyInfo.fromJson(json['country'] as Map<String, dynamic>),
    licenseNumber:
        PropertyInfo.fromJson(json['licenseNumber'] as Map<String, dynamic>),
    licenceType:
        PropertyInfo.fromJson(json['licenceType'] as Map<String, dynamic>),
    licenseExpirationDate: PropertyInfo.fromJson(
        json['licenseExpirationDate'] as Map<String, dynamic>),
    typeOfPractice:
        PropertyInfo.fromJson(json['typeOfPractice'] as Map<String, dynamic>),
    firstName: PropertyInfo.fromJson(json['firstName'] as Map<String, dynamic>),
    lastName: PropertyInfo.fromJson(json['lastName'] as Map<String, dynamic>),
    email: PropertyInfo.fromJson(json['email'] as Map<String, dynamic>),
  )..contactDetails = OrganizationContactDetails.fromJson(
      json['contactDetails'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId.toJson(),
      'organizationName': instance.organizationName.toJson(),
      'dateOfSignUp': instance.dateOfSignUp.toJson(),
      'numberOfUsers': instance.numberOfUsers.toJson(),
      'mobileNumber': instance.mobileNumber.toJson(),
      'organizationStatus': instance.organizationStatus.toJson(),
      'country': instance.country.toJson(),
      'licenseNumber': instance.licenseNumber.toJson(),
      'licenceType': instance.licenceType.toJson(),
      'licenseExpirationDate': instance.licenseExpirationDate.toJson(),
      'typeOfPractice': instance.typeOfPractice.toJson(),
      'firstName': instance.firstName.toJson(),
      'lastName': instance.lastName.toJson(),
      'email': instance.email.toJson(),
      'contactDetails': instance.contactDetails.toJson(),
    };
