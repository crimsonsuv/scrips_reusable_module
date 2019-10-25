// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] as String,
    fullName: json['fullName'] as String,
    userName: json['userName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'accessToken': instance.accessToken,
    };
