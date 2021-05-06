// To parse this JSON data, do
//
//     final locations = locationsFromJson(jsonString);

import 'dart:convert';

import 'package:scrips_core/common/data/datamodels/location_by_placeid_model.dart';

Locations locationsFromJson(String str) => Locations.fromJson(json.decode(str));

String locationsToJson(Locations data) => json.encode(data.toJson());

class Locations {
  List<Prediction> predictions;
  String status;

  Locations({
    this.predictions,
    this.status,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        predictions: json["predictions"] == null
            ? null
            : List<Prediction>.from(
                json["predictions"].map((x) => Prediction.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "predictions": predictions == null
            ? null
            : List<dynamic>.from(predictions.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class Prediction {
  String description;
  String id;
  List<MatchedSubstring> matchedSubstrings;
  String placeId;
  String reference;
  StructuredFormatting structuredFormatting;
  List<Term> terms;
  List<String> types;
  Location location;

  Prediction(
      {this.description,
      this.id,
      this.matchedSubstrings,
      this.placeId,
      this.reference,
      this.structuredFormatting,
      this.terms,
      this.types,
      this.location});

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"],
        matchedSubstrings: json["matched_substrings"] == null
            ? null
            : List<MatchedSubstring>.from(json["matched_substrings"]
                .map((x) => MatchedSubstring.fromJson(x))),
        placeId: json["place_id"] == null ? null : json["place_id"],
        reference: json["reference"] == null ? null : json["reference"],
        structuredFormatting: json["structured_formatting"] == null
            ? null
            : StructuredFormatting.fromJson(json["structured_formatting"]),
        terms: json["terms"] == null
            ? null
            : List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "id": id == null ? null : id,
        "matched_substrings": matchedSubstrings == null
            ? null
            : List<dynamic>.from(matchedSubstrings.map((x) => x.toJson())),
        "place_id": placeId == null ? null : placeId,
        "reference": reference == null ? null : reference,
        "structured_formatting":
            structuredFormatting == null ? null : structuredFormatting.toJson(),
        "terms": terms == null
            ? null
            : List<dynamic>.from(terms.map((x) => x.toJson())),
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
        "location": location == null ? null : location.toJson(),
      };
}

class MatchedSubstring {
  int length;
  int offset;

  MatchedSubstring({
    this.length,
    this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) =>
      MatchedSubstring(
        length: json["length"] == null ? null : json["length"],
        offset: json["offset"] == null ? null : json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "length": length == null ? null : length,
        "offset": offset == null ? null : offset,
      };
}

class StructuredFormatting {
  String mainText;
  List<MatchedSubstring> mainTextMatchedSubstrings;
  String secondaryText;
  List<MatchedSubstring> secondaryTextMatchedSubstrings;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
    this.secondaryTextMatchedSubstrings,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      StructuredFormatting(
        mainText: json["main_text"] == null ? null : json["main_text"],
        mainTextMatchedSubstrings: json["main_text_matched_substrings"] == null
            ? null
            : List<MatchedSubstring>.from(json["main_text_matched_substrings"]
                .map((x) => MatchedSubstring.fromJson(x))),
        secondaryText:
            json["secondary_text"] == null ? null : json["secondary_text"],
        secondaryTextMatchedSubstrings:
            json["secondary_text_matched_substrings"] == null
                ? null
                : List<MatchedSubstring>.from(
                    json["secondary_text_matched_substrings"]
                        .map((x) => MatchedSubstring.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "main_text": mainText == null ? null : mainText,
        "main_text_matched_substrings": mainTextMatchedSubstrings == null
            ? null
            : List<dynamic>.from(
                mainTextMatchedSubstrings.map((x) => x.toJson())),
        "secondary_text": secondaryText == null ? null : secondaryText,
        "secondary_text_matched_substrings":
            secondaryTextMatchedSubstrings == null
                ? null
                : List<dynamic>.from(
                    secondaryTextMatchedSubstrings.map((x) => x.toJson())),
      };
}

class Term {
  int offset;
  String value;

  Term({
    this.offset,
    this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json["offset"] == null ? null : json["offset"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset == null ? null : offset,
        "value": value == null ? null : value,
      };
}
