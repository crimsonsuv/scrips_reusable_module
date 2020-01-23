// To parse this JSON data, do
//
//     final loginByCode = loginByCodeFromJson(jsonString);

import 'dart:convert';

LoginByCode loginByCodeFromJson(String str) => LoginByCode.fromJson(json.decode(str));

String loginByCodeToJson(LoginByCode data) => json.encode(data.toJson());

class LoginByCode {
  String email;
  String code;

  LoginByCode({
    this.email,
    this.code,
  });

  factory LoginByCode.fromJson(Map<String, dynamic> json) => LoginByCode(
    email: json["email"] == null ? null : json["email"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "code": code == null ? null : code,
  };
}
