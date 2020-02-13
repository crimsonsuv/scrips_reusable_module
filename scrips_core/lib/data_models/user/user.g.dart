// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: PropertyInfo.fromJson(json['userId'] as Map<String, dynamic>),
    fullName: PropertyInfo.fromJson(json['fullName'] as Map<String, dynamic>),
    userName: PropertyInfo.fromJson(json['userName'] as Map<String, dynamic>),
    gender: PropertyInfo.fromJson(json['gender'] as Map<String, dynamic>),
    phoneNumber:
        PropertyInfo.fromJson(json['phoneNumber'] as Map<String, dynamic>),
    email: PropertyInfo.fromJson(json['email'] as Map<String, dynamic>),
    accessToken:
        PropertyInfo.fromJson(json['accessToken'] as Map<String, dynamic>),
    lastLoggedIn:
        PropertyInfo.fromJson(json['lastLoggedIn'] as Map<String, dynamic>),
    password: PropertyInfo.fromJson(json['password'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId.toJson(),
      'fullName': instance.fullName.toJson(),
      'userName': instance.userName.toJson(),
      'gender': instance.gender.toJson(),
      'phoneNumber': instance.phoneNumber.toJson(),
      'email': instance.email.toJson(),
      'password': instance.password.toJson(),
      'accessToken': instance.accessToken.toJson(),
      'lastLoggedIn': instance.lastLoggedIn.toJson(),
    };
