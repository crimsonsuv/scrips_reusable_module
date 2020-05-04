// To parse this JSON data, do
//
//     final loginUserData = loginUserDataFromJson(jsonString);

import 'dart:convert';

LoginUserData loginUserDataFromJson(String str) =>
    LoginUserData.fromJson(json.decode(str));

String loginUserDataToJson(LoginUserData data) => json.encode(data.toJson());

class LoginUserData {
  String firstName;
  String lastName;
  String emailAddress;
  String userName;
  String role;
  String id;
  String country;
  bool status;
  String organizationId;
  String practiceId;

  LoginUserData({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userName,
    this.role,
    this.id,
    this.country,
    this.status,
    this.organizationId,
    this.practiceId,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        emailAddress:
            json["emailAddress"] == null ? null : json["emailAddress"],
        userName: json["userName"] == null ? null : json["userName"],
        role: json["role"] == null ? null : json["role"],
        id: json["id"] == null ? null : json["id"],
        country: json["country"] == null ? null : json["country"],
        status: json["status"] == null ? null : json["status"],
        organizationId:
            json["organizationId"] == null ? null : json["organizationId"],
        practiceId: json["practiceId"] == null ? null : json["practiceId"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "userName": userName == null ? null : userName,
        "role": role == null ? null : role,
        "id": id == null ? null : id,
        "country": country == null ? null : country,
        "status": status == null ? null : status,
        "organizationId": organizationId == null ? null : organizationId,
        "practiceId": practiceId == null ? null : practiceId,
      };
}
