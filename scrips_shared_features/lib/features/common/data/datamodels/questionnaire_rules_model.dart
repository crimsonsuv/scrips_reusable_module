// To parse this JSON data, do
//
//     final questionnaireRules = questionnaireRulesFromJson(jsonString);

import 'dart:convert';

List<QuestionnaireRules> questionnaireRulesFromJson(String str) =>
    List<QuestionnaireRules>.from(
        json.decode(str).map((x) => QuestionnaireRules.fromJson(x)));

String questionnaireRulesToJson(List<QuestionnaireRules> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionnaireRules {
  String id;
  String title;

  QuestionnaireRules({
    this.id,
    this.title,
  });

  factory QuestionnaireRules.fromJson(Map<String, dynamic> json) =>
      QuestionnaireRules(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
