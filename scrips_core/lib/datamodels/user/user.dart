import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String userId;
  String fullName;
  String userName;
  String phoneNumber;
  String email;
  String accessToken;
  DateTime lastLoggedIn;

  User({this.userId, this.fullName, this.userName, this.phoneNumber, this.email, this.accessToken, this.lastLoggedIn});

  User.initial()
      : userId = '',
        fullName = '',
        userName = '',
        email = '',
        phoneNumber = '',
        accessToken = '';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
