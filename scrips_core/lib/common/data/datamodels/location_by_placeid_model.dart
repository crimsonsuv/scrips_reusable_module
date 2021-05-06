// To parse this JSON data, do
//
//     final locationByPlaceId = locationByPlaceIdFromJson(jsonString);

import 'dart:convert';

LocationByPlaceId locationByPlaceIdFromJson(String str) =>
    LocationByPlaceId.fromJson(json.decode(str));

String locationByPlaceIdToJson(LocationByPlaceId data) =>
    json.encode(data.toJson());

class LocationByPlaceId {
  LocationByPlaceId({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  List<dynamic> htmlAttributions;
  Result result;
  String status;

  factory LocationByPlaceId.fromJson(Map<String, dynamic> json) =>
      LocationByPlaceId(
        htmlAttributions: json["html_attributions"] == null
            ? null
            : List<dynamic>.from(json["html_attributions"].map((x) => x)),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions == null
            ? null
            : List<dynamic>.from(htmlAttributions.map((x) => x)),
        "result": result == null ? null : result.toJson(),
        "status": status == null ? null : status,
      };
}

class Result {
  Result({
    this.geometry,
    this.name,
  });

  Geometry geometry;
  String name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry == null ? null : geometry.toJson(),
        "name": name == null ? null : name,
      };
}

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location location;
  Viewport viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null
            ? null
            : Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "viewport": viewport == null ? null : viewport.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location northeast;
  Location southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null
            ? null
            : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
      };
}
