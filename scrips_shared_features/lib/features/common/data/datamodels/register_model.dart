// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String role;

  RegisterModel({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.role,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "role": role == null ? null : role,
      };
}
