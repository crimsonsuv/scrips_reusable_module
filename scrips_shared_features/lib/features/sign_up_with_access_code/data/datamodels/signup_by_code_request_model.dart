// To parse this JSON data, do
//
//     final signupWithCodeRequest = signupWithCodeRequestFromJson(jsonString);

import 'dart:convert';

SignupWithCodeRequest signupWithCodeRequestFromJson(String str) =>
    SignupWithCodeRequest.fromJson(json.decode(str));

String signupWithCodeRequestToJson(SignupWithCodeRequest data) =>
    json.encode(data.toJson());

class SignupWithCodeRequest {
  String email;
  String code;

  SignupWithCodeRequest({
    this.email,
    this.code,
  });

  factory SignupWithCodeRequest.fromJson(Map<String, dynamic> json) =>
      SignupWithCodeRequest(
        email: json["email"] == null ? null : json["email"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "code": code == null ? null : code,
      };
}
