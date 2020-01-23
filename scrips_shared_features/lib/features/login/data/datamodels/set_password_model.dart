// To parse this JSON data, do
//
//     final setPasswordModel = setPasswordModelFromJson(jsonString);

import 'dart:convert';

SetPasswordModel setPasswordModelFromJson(String str) => SetPasswordModel.fromJson(json.decode(str));

String setPasswordModelToJson(SetPasswordModel data) => json.encode(data.toJson());

class SetPasswordModel {
  String email;
  String password;
  String confirmPassword;
  String passwordResetToken;

  SetPasswordModel({
    this.email,
    this.password,
    this.confirmPassword,
    this.passwordResetToken,
  });

  factory SetPasswordModel.fromJson(Map<String, dynamic> json) => SetPasswordModel(
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    confirmPassword: json["confirmPassword"] == null ? null : json["confirmPassword"],
    passwordResetToken: json["passwordResetToken"] == null ? null : json["passwordResetToken"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "confirmPassword": confirmPassword == null ? null : confirmPassword,
    "passwordResetToken": passwordResetToken == null ? null : passwordResetToken,
  };
}
