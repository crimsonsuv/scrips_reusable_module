// To parse this JSON data, do
//
//     final loginTokens = loginTokensFromJson(jsonString);

import 'dart:convert';

LoginTokens loginTokensFromJson(String str) => LoginTokens.fromJson(json.decode(str));

String loginTokensToJson(LoginTokens data) => json.encode(data.toJson());

class LoginTokens {
  String accessToken;
  String refreshToken;
  int expiresIn;
  String identityToken;

  LoginTokens({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.identityToken,
  });

  factory LoginTokens.fromJson(Map<String, dynamic> json) => LoginTokens(
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
    refreshToken: json["refreshToken"] == null ? null : json["refreshToken"],
    expiresIn: json["expiresIn"] == null ? null : json["expiresIn"],
    identityToken: json["identityToken"] == null ? null : json["identityToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken == null ? null : accessToken,
    "refreshToken": refreshToken == null ? null : refreshToken,
    "expiresIn": expiresIn == null ? null : expiresIn,
    "identityToken": identityToken == null ? null : identityToken,
  };
}
