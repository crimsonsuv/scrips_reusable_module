// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  String email;
  String password;
  String confirmPassword;
  String passwordResetToken;

  ResetPasswordModel({
    this.email,
    this.password,
    this.confirmPassword,
    this.passwordResetToken,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
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
