// To parse this JSON data, do
//
//     final locationRequest = locationRequestFromJson(jsonString);

import 'dart:convert';

LocationRequest locationRequestFromJson(String str) =>
    LocationRequest.fromJson(json.decode(str));

String locationRequestToJson(LocationRequest data) =>
    json.encode(data.toJson());

class LocationRequest {
  String input;
  String types;
  String language;
  String key;

  LocationRequest({
    this.input,
    this.types,
    this.language,
    this.key,
  });

  factory LocationRequest.fromJson(Map<String, dynamic> json) =>
      LocationRequest(
        input: json["input"] == null ? null : json["input"],
        types: json["types"] == null ? null : json["types"],
        language: json["language"] == null ? null : json["language"],
        key: json["key"] == null ? null : json["key"],
      );

  Map<String, dynamic> toJson() => {
        "input": input == null ? null : input,
        "types": types == null ? null : types,
        "language": language == null ? null : language,
        "key": key == null ? null : key,
      };
}
