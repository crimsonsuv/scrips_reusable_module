// To parse this JSON data, do
//
//     final signUpUserData = signUpUserDataFromJson(jsonString);

import 'dart:convert';

SignUpUserData signUpUserDataFromJson(String str) =>
    SignUpUserData.fromJson(json.decode(str));

String signUpUserDataToJson(SignUpUserData data) => json.encode(data.toJson());

class SignUpUserData {
  String firstName;
  String lastName;
  String emailAddress;
  String name;
  int roleId;

  SignUpUserData({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.name,
    this.roleId,
  });

  factory SignUpUserData.fromJson(Map<String, dynamic> json) => SignUpUserData(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        emailAddress:
            json["emailAddress"] == null ? null : json["emailAddress"],
        name: json["name"] == null ? null : json["name"],
        roleId: json["roleId"] == null ? null : json["roleId"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "name": name == null ? null : name,
        "roleId": roleId == null ? null : roleId,
      };
}
