// To parse this JSON data, do
//
//     final loginUserData = loginUserDataFromJson(jsonString);

import 'dart:convert';

LoginUserData loginUserDataFromJson(String str) => LoginUserData.fromJson(json.decode(str));

String loginUserDataToJson(LoginUserData data) => json.encode(data.toJson());

class LoginUserData {
  String username;
  String firstName;
  String lastName;
  String emailAddress;
  String role;

  LoginUserData({
    this.username,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.role,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
    username: json["username"] == null ? null : json["username"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "emailAddress": emailAddress == null ? null : emailAddress,
    "role": role == null ? null : role,
  };
}
