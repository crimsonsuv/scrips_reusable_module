// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'dart:convert';

List<Language> languageFromJson(String str) =>
    List<Language>.from(json.decode(str).map((x) => Language.fromJson(x)));

String languageToJson(List<Language> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Language {
  String id;
  String languageName;

  Language({
    this.id,
    this.languageName,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["Id"] == null ? null : json["Id"],
        languageName:
            json["LanguageName"] == null ? null : json["LanguageName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "LanguageName": languageName == null ? null : languageName,
      };
}
