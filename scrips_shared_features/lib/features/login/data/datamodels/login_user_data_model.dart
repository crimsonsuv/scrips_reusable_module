// To parse this JSON data, do
//
//     final loginUserData = loginUserDataFromJson(jsonString);

import 'dart:convert';

LoginUserData loginUserDataFromJson(String str) => LoginUserData.fromJson(json.decode(str));

String loginUserDataToJson(LoginUserData data) => json.encode(data.toJson());

class LoginUserData {
  String firstName;
  String lastName;
  String emailAddress;
  String userName;
  String role;
  String id;
  String country;

  LoginUserData({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userName,
    this.role,
    this.id,
    this.country,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
    userName: json["userName"] == null ? null : json["userName"],
    role: json["role"] == null ? null : json["role"],
    id: json["id"] == null ? null : json["id"],
    country: json["country"] == null ? null : json["country"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "emailAddress": emailAddress == null ? null : emailAddress,
    "userName": userName == null ? null : userName,
    "role": role == null ? null : role,
    "id": id == null ? null : id,
    "country": country == null ? null : country,
  };
}
