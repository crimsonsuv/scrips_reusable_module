// To parse this JSON data, do
//
//     final valueSetData = valueSetDataFromJson(jsonString);

import 'dart:convert';

import 'package:scrips_core/common/data/mixin/mixin.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/code.dart';

List<ValueSetData> valueSetDataFromJson(String str) => List<ValueSetData>.from(
    json.decode(str).map((x) => ValueSetData.fromJson(x)));

String valueSetDataToJson(List<ValueSetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ValueSetData with TitleMixin, DescriptionMixin, SearchableMixin, CodeMixin {
  Code valueCoding;

  ValueSetData({
    this.valueCoding,
  });

  factory ValueSetData.fromJson(Map<String, dynamic> json) => ValueSetData(
        valueCoding: json["valueCoding"] == null
            ? null
            : Code.fromJson(json["valueCoding"]),
      );

  Map<String, dynamic> toJson() => {
        "valueCoding": valueCoding == null ? null : valueCoding.toJson(),
      };

  String get title => valueCoding?.display ?? "";
  String get displayCode => valueCoding?.code ?? "";
  String get description => valueCoding?.code ?? "";

  bool containQuery(String text){
    return (title ?? "").toLowerCase().contains(text);
  }

  @override
  String toString() {
    return title;
  }

}


