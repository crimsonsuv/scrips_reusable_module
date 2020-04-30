// To parse this JSON data, do
//
//     final createPasswordRequest = createPasswordRequestFromJson(jsonString);

import 'dart:convert';

CreatePasswordRequest createPasswordRequestFromJson(String str) =>
    CreatePasswordRequest.fromJson(json.decode(str));

String createPasswordRequestToJson(CreatePasswordRequest data) =>
    json.encode(data.toJson());

class CreatePasswordRequest {
  String email;
  String password;
  String confirmPassword;
  String passwordResetToken;

  CreatePasswordRequest({
    this.email,
    this.password,
    this.confirmPassword,
    this.passwordResetToken,
  });

  factory CreatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      CreatePasswordRequest(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        confirmPassword:
            json["confirmPassword"] == null ? null : json["confirmPassword"],
        passwordResetToken: json["passwordResetToken"] == null
            ? null
            : json["passwordResetToken"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "confirmPassword": confirmPassword == null ? null : confirmPassword,
        "passwordResetToken":
            passwordResetToken == null ? null : passwordResetToken,
      };
}
