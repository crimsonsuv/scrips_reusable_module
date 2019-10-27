import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  PropertyInfo<String> userId;
  PropertyInfo<String> fullName;
  PropertyInfo<String> userName;
  PropertyInfo<String> gender;
  PropertyInfo<String> phoneNumber;
  PropertyInfo<String> email;
  PropertyInfo<String> accessToken;
  PropertyInfo<DateTime> lastLoggedIn;

  User({this.userId, this.fullName, this.userName, this.gender, this.phoneNumber, this.email, this.accessToken, this.lastLoggedIn});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
