import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

//part 'user.g.dart';

//@JsonSerializable(explicitToJson: true)
class User {
  PropertyInfo<String> userId;
  PropertyInfo<String> fullName;
  PropertyInfo<String> userName;
  PropertyInfo<String> gender;
  PropertyInfo<String> phoneNumber;
  PropertyInfo<String> email;
  PropertyInfo<String> password;
  PropertyInfo<String> accessToken;
  PropertyInfo<DateTime> lastLoggedIn;

  User({
    @required this.userId,
    @required this.fullName,
    @required this.userName,
    @required this.gender,
    @required this.phoneNumber,
    @required this.email,
    @required this.accessToken,
    @required this.lastLoggedIn,
    @required this.password,
  });

  factory User.defaults() {
    return new User(
      userId: PropertyInfo<String>(null),
      fullName: PropertyInfo<String>(null),
      userName: PropertyInfo<String>(null),
      gender: PropertyInfo<String>(null),
      phoneNumber: PropertyInfo<String>(null),
      email: PropertyInfo<String>(null),
      accessToken: PropertyInfo<String>(null),
      lastLoggedIn: PropertyInfo<DateTime>(null),
      password: PropertyInfo<String>(null),
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static User _$UserFromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['userId'] as Map<String, dynamic>),
      fullName: json['fullName'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['fullName'] as Map<String, dynamic>),
      userName: json['userName'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['userName'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['gender'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      email: json['email'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['email'] as Map<String, dynamic>),
      accessToken: json['accessToken'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['accessToken'] as Map<String, dynamic>),
      lastLoggedIn: json['lastLoggedIn'] == null
          ? PropertyInfo(null)
          : PropertyInfo.fromJson(json['lastLoggedIn'] as Map<String, dynamic>),
      password: PropertyInfo(null),
    );
  }

  static Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
        'userId': instance.userId?.toJson(),
        'fullName': instance.fullName?.toJson(),
        'userName': instance.userName?.toJson(),
        'gender': instance.gender?.toJson(),
        'phoneNumber': instance.phoneNumber?.toJson(),
        'email': instance.email?.toJson(),
        'accessToken': instance.accessToken?.toJson(),
        'lastLoggedIn': instance.lastLoggedIn?.toJson(),
        'password': '',
      };
}
