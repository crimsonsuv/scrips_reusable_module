// To parse this JSON data, do
//
//     final procedureCodesList = procedureCodesListFromJson(jsonString);

import 'dart:convert';

import 'package:scrips_shared_features/features/common/data/datamodels/speciality_valueset_list_model.dart';

List<CodeList> procedureCodesListFromJson(String str) =>
    List<CodeList>.from(json.decode(str).map((x) => CodeList.fromJson(x)));

String procedureCodesListToJson(List<CodeList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
