// To parse this JSON data, do
//
//     final twilioResponse = twilioResponseFromJson(jsonString);

import 'dart:convert';

TwilioResponse twilioResponseFromJson(String str) =>
    TwilioResponse.fromJson(json.decode(str));

String twilioResponseToJson(TwilioResponse data) => json.encode(data.toJson());

class TwilioResponse {
  dynamic callerName;
  String countryCode;
  String phoneNumber;
  String nationalFormat;
  dynamic carrier;
  dynamic addOns;
  String url;

  TwilioResponse({
    this.callerName,
    this.countryCode,
    this.phoneNumber,
    this.nationalFormat,
    this.carrier,
    this.addOns,
    this.url,
  });

  factory TwilioResponse.fromJson(Map<String, dynamic> json) => TwilioResponse(
        callerName: json["caller_name"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        nationalFormat:
            json["national_format"] == null ? null : json["national_format"],
        carrier: json["carrier"],
        addOns: json["add_ons"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "caller_name": callerName,
        "country_code": countryCode == null ? null : countryCode,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "national_format": nationalFormat == null ? null : nationalFormat,
        "carrier": carrier,
        "add_ons": addOns,
        "url": url == null ? null : url,
      };
}
