// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] == null
        ? null
        : PropertyInfo.fromJson(json['userId'] as Map<String, dynamic>),
    fullName: json['fullName'] == null
        ? null
        : PropertyInfo.fromJson(json['fullName'] as Map<String, dynamic>),
    userName: json['userName'] == null
        ? null
        : PropertyInfo.fromJson(json['userName'] as Map<String, dynamic>),
    phoneNumber: json['phoneNumber'] == null
        ? null
        : PropertyInfo.fromJson(json['phoneNumber'] as Map<String, dynamic>),
    email: json['email'] == null
        ? null
        : PropertyInfo.fromJson(json['email'] as Map<String, dynamic>),
    accessToken: json['accessToken'] == null
        ? null
        : PropertyInfo.fromJson(json['accessToken'] as Map<String, dynamic>),
    lastLoggedIn: json['lastLoggedIn'] == null
        ? null
        : PropertyInfo.fromJson(json['lastLoggedIn'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId?.toJson(),
      'fullName': instance.fullName?.toJson(),
      'userName': instance.userName?.toJson(),
      'phoneNumber': instance.phoneNumber?.toJson(),
      'email': instance.email?.toJson(),
      'accessToken': instance.accessToken?.toJson(),
      'lastLoggedIn': instance.lastLoggedIn?.toJson(),
    };
