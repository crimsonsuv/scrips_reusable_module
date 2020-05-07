// To parse this JSON data, do
//
//     final signupByCodeResponse = signupByCodeResponseFromJson(jsonString);

import 'dart:convert';

SignupByCodeResponse signupByCodeResponseFromJson(String str) =>
    SignupByCodeResponse.fromJson(json.decode(str));

String signupByCodeResponseToJson(SignupByCodeResponse data) =>
    json.encode(data.toJson());

class SignupByCodeResponse {
  String passwordResetToken;
  String emailAddress;

  SignupByCodeResponse({
    this.passwordResetToken,
    this.emailAddress,
  });

  factory SignupByCodeResponse.fromJson(Map<String, dynamic> json) =>
      SignupByCodeResponse(
        passwordResetToken: json["passwordResetToken"] == null
            ? null
            : json["passwordResetToken"],
        emailAddress:
            json["emailAddress"] == null ? null : json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "passwordResetToken":
            passwordResetToken == null ? null : passwordResetToken,
        "emailAddress": emailAddress == null ? null : emailAddress,
      };
}
