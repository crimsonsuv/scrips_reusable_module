import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/general/property_info.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  //   sumeet: essential to mark all fields with @JsonKey(nullable: false)to ensure all PropertyInfos are created properly in fromJson
  @JsonKey(nullable: false)
  PropertyInfo<String> userId;
  @JsonKey(nullable: false)
  PropertyInfo<String> fullName;
  @JsonKey(nullable: false)
  PropertyInfo<String> userName;
  @JsonKey(nullable: false)
  PropertyInfo<String> gender;
  @JsonKey(nullable: false)
  PropertyInfo<String> phoneNumber;
  @JsonKey(nullable: false)
  PropertyInfo<String> email;
  @JsonKey(nullable: false)
  PropertyInfo<String> password;
  @JsonKey(nullable: false)
  PropertyInfo<String> accessToken;
  @JsonKey(nullable: false)
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
}
