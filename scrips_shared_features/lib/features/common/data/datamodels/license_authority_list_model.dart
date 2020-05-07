// To parse this JSON data, do
//
//     final licenseAuthority = licenseAuthorityFromJson(jsonString);

import 'dart:convert';

List<LicenseAuthority> licenseAuthorityFromJson(String str) =>
    List<LicenseAuthority>.from(
        json.decode(str).map((x) => LicenseAuthority.fromJson(x)));

String licenseAuthorityToJson(List<LicenseAuthority> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LicenseAuthority {
  String id;
  String name;

  LicenseAuthority({
    this.id,
    this.name,
  });

  factory LicenseAuthority.fromJson(Map<String, dynamic> json) =>
      LicenseAuthority(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
      };
}
