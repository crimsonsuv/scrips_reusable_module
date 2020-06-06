// To parse this JSON data, do
//
//     final appointmentValueSets = appointmentValueSetsFromJson(jsonString);

import 'dart:convert';

List<AppointmentValueSets> appointmentValueSetsFromJson(String str) =>
    List<AppointmentValueSets>.from(
        json.decode(str).map((x) => AppointmentValueSets.fromJson(x)));

String appointmentValueSetsToJson(List<AppointmentValueSets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentValueSets {
  AppointmentValueSets({
    this.code,
    this.definition,
    this.display,
  });

  String code;
  String definition;
  String display;

  factory AppointmentValueSets.fromJson(Map<String, dynamic> json) =>
      AppointmentValueSets(
        code: json["code"] == null ? null : json["code"],
        definition: json["definition"] == null ? null : json["definition"],
        display: json["display"] == null ? null : json["display"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "definition": definition == null ? null : definition,
        "display": display == null ? null : display,
      };
}
